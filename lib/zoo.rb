class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :season_opening_date, :season_closing_date
  attr_accessor :cages, :employees

  def initialize(name, start_time, end_time)
    @name = name
    @season_opening_date = start_time
    @season_closing_date = end_time
    @cages = []
    10.times do
      cages << Cage.new
    end
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    output = ""
    @employees.each do |employee|
      output += "#{employee.name} waved hello!\n"
    end

    @cages.each do |cage|
      output += "#{cage.animal.speak}\n" unless cage.empty?
    end
    output
  end
end
