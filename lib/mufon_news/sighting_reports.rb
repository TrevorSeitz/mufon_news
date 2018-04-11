class Sighting

  attr_accessor :case_number, :date_submitted, :date_of_event, :description, :city, :state

  @@all = []

  def initialize(case_number, date_submitted, date_of_event, description, city, state)
    if !@@all.include?(case_number)
      @case_number = case_number
      @date_submitted = date_submitted
      @date_of_event = date_of_event
      @description = description
      @city = city
      @state = state
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.reset
    @@all = []
  end

end