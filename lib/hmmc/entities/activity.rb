module HMMC
  class Activity < Entity
    attr_accessor :id, :school_id, :miles, :students, :date

    def initialize(attrs={})
      @date ||= Time.now
      @miles ||=0
      super(attrs)
    end

  end
end


# DateTime.parse('may 7')
# gives a datetime object that looks like this:
# ed, 07 May 2014 00:00:00 +0000
# Wed, 07 May 2014 00:00:00 +0000
# I can copy paste that into Time.parse to get a time object like this:
# Time.parse("Wed, 07 May 2014 22:47:18 -0500")

# Time.parse(DateTime.parse('may 7').to_s)

  # user creates a school, then inputs
  # class School  has_many , has_many :users #toal number of studnet in the program
  # class Activity elongsto school  # number of studnet exerces at that certain acitvy

  # class User      belongs_to school


# creatw a school, get schol from databse, so maybe get_school? not create

# we have no databse of schols right now.

# School.where(:state => "Texas")
# school landin gpage


# add miles input:           num studnets :input        :button  time :input

 # create_table "activities" force:true do |t|
 #      t.interger :miles
 #      t.integer :students
 #      t.datetime :date yyyy/mm/day
 #      t.timestamps
 #    end

 #    date = Time.parse("May 8 2014")
