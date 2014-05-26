class SchoolsController < ApplicationController
  layout "application"
  require 'active_support/core_ext'
  require 'rexml/document'
  require 'net/http'

  def new
    # @school = HMMC::School.new
  end

  def test

  end

  def index
    # "state"=>"CA", "zipcode"=>"91942", "action"=>"index", "controller"=>"schools"}

    # get the XML data as a string
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

    @schools = HMMC.db.get_all_schools
    @schools_by_zip = @schools.select {|school| school.zipcode ==  params["validate-number"].to_i}

    selected_school = @schools_by_zip.select{|school| school.name == params["validate-select"]}


    user_params = params[:user]



    school_params = params[:school]

    signedup = HMMC::SignUp.run(
      :name => params["validate-text"],
      :email => params["validate-email"],
      :password=> params["validate-length"],
      :school_name => selected_school[0].name,
      :street => selected_school[0].street,
      :city => selected_school[0].city,
      :state=>selected_school[0].state,
      :students=> 500,
      :lat => selected_school[0].lat,
      :long => selected_school[0].long
      )




    @user = signedup.user


    if signedup.success?
      @school = signedup.school
      @user = signedup.user

      session[:app_sid] = signedup.session_id
      email = UserMailer.sign_up_mail(@user.id,@school.id)
      email.deliver

      flash[:notice] = "Hello #{@user.name} you have successfully signed up"

      render "schools/aftersignup"
      # button school landing pg
    else
      @error = signedup.error
      flash[:notice] = "Please fill in all of the input labels"
      render "schools/signup"
    end

  end
  def show

    flash[:error]

# rank = ""
# array.each_index do |index|
# if array[index] == 3
# rank = index
# end
# end
# [1, 2, 3, 4]
# rank
# 2
# rank+1
# 3
    @school = HMMC.db.get_school(params[:id].to_i)
    @user = HMMC.db.get_user_by_sid(session[:app_sid])

    if @user != nil
     # @users_school = HMMC.db.get_school_from_user_id(@user.id)
     # national_rank = HMMC.db.get_national_ranking
     # @schools = HMMC.db.get_all_schools_sign_up
     # @rank = ""
     # national_rank.each_index do |index|
     #  if national_rank[index].id == @users_school.id
     #    @rank = index + 1

     #  end
     # end

     # puts @users_school.state
    end

  end

  def edit

  end

  def update

    binding.pry
    @school = HMMC.db.get_school(params[:id].to_i)
    @school1 = HMMC.db.update_school(:id => params[:id].to_i, :students => @school.students.to_i + params[:school][:students].to_i)
    # redirect_to "/schools/#{@school1.id}"

     respond_to do |format|
      format.html
      format.json { render :json => @school1.students }
      # format.xml { render :xml => {school: xml_data} }
    end

  end

  def leaderboard
    @top_school_array = HMMC.db.get_national_ranking
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

  def signup

  end

  def aftersignup

  end

  private
  def school_params
    params.require(:school).permit(:name, :state, :street, :city)
  end


end




