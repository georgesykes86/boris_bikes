require_relative 'bike.rb'

class DockingStation
attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

def initialize(capacity = DEFAULT_CAPACITY)
  @bikes = []
  @capacity = capacity
end

  def release_bike
    raise StandardError.new("No bikes available") if empty?
    @bikes.pop
  end

  def dock(bike)
    raise StandardError.new("Bike station is full") if full?
    @bikes << bike
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
