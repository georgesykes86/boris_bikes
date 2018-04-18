require_relative 'bike.rb'

class DockingStation
attr_reader :bikes

def initialize
  @bikes = []
end

  def release_bike
    if @bikes.empty?
       raise StandardError.new("No bikes available")
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if @bikes.length >= 20
      raise StandardError.new("Bike station is full")
    else
      @bikes << bike
    end
  end

end
