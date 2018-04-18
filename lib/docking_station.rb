require_relative 'bike.rb'

class DockingStation
attr_reader :bike

  def release_bike
    if @bike == nil
       raise StandardError.new("No bikes available")
    else
      @bike
    end
  end

  def dock(bike)
    if @bike != nil
      raise StandardError.new("Bike station is full")
    else
      @bike = bike
    end
  end

end
