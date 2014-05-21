class SchoolsController < ApplicationController
  layout "application"
  require 'active_support/core_ext'
  require 'rexml/document'
  require 'net/http'

  def new
    # @school = HMMC::School.new
  end

  def index
    # "state"=>"CA", "zipcode"=>"91942", "action"=>"index", "controller"=>"schools"}
    # url = "http://api.greatschools.org/schools/nearby?key=revggwvdiu5ajixg6avnaqxx&state=#{params[:state]}&zip=#{params[:zipcode]}&limit1"
    # get the XML data as a string
    # binding.pry
    # xml_data = Net::HTTP.get_response(URI.parse(url)).body


    @schools = HMMC.db.get_all_schools

    @schools_by_zip = @schools.select {|school| school.zipcode ==  params[:zipcode].to_i}
    # display on the page;
    # person selects school, will get the school paramters
    # you need to populate shit ton of seed in your data
    puts @schools_by_zip


    # @hash = Hash.from_xml(xml_data)

    # puts hash.class
    # @json = @hash.to_json
    # binding.pry
    # @hash.each do |key, value|
    #   puts value
    # end

    respond_to do |format|
      format.html
      format.json { render :json => @schools_by_zip }
      # format.xml { render :xml => {school: xml_data} }
    end

  end

  def search
  end

  def create
    user_params = params[:user]
    school_params = params[:school]

    signedup = HMMC::SignUp.run(
      :name => user_params[:name],
      :email => user_params[:email],
      :password=> user_params[:password],
      :school_name => school_params[:name],
      :street => school_params[:street],
      :city => school_params[:city],
      :state=>school_params[:state],
      :students=> school_params[:students]
      )

    if signedup.success?
      @school = signedup.school
      @user = signedup.user
      email = UserMailer.sign_up_mail(@user.id,@school.id)
      email.deliver

      flash[:notice] = "Hello #{@user.name} you have successfully signed up"

      # button school landing pg
      redirect_to "/"
    else
      @error = signedup.error
      redirect_to "/"
    end

  end

  def show

    flash[:error]

    @school = HMMC.db.get_school(params[:id].to_i)
    @user = HMMC.db.get_user_by_sid(session[:app_sid])
    if @user != nil
     @users_school = HMMC.db.get_school_from_user_id(@user.id)
    end

  end

  def edit

  end

  def update
    @school = HMMC.db.get_school(params[:id].to_i)
    @school1 = HMMC.db.update_school(:id => params[:id].to_i, :students => @school.students.to_i + params[:school][:students].to_i)
    redirect_to "/schools/#{@school1.id}"
  end

  def leaderboard
		render :layout => 'home'
  end

  def search

    @schoolist = HMMC.db.get_all_schools
    @render_school = []
    @schoolist.each  do |schoolhash|
      if schoolhash[:name].include? (params[:userInput])
        @render_school << schoolhash
      end
    end

    respond_to do |format|
      format.html
      format.json  { render :json => {school: @render_school} }
    end

  end

  private
  def school_params
    params.require(:school).permit(:name, :state, :street, :city)
  end


end




