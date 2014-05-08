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

  # user creates a school, then inputs
  # class School  has_many , has_many :users #toal number of studnet in the program
  # class Activity elongsto school  # number of studnet exerces at that certain acitvy

  # class User      belongs_to school


# creatw a school, get schol from databse, so maybe get_school? not create

# we have no databse of schols right now.

# School.where(:state => "Texas")
