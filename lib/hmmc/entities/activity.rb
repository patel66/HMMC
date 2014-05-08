module HMMC
  class Activity < Entity
    attr_accessor :school_id, :miles, :students, :date

    def initialize(attrs={})
      @date ||= Time.now
      @miles ||=0
      super(attrs)
    end

  end
end
