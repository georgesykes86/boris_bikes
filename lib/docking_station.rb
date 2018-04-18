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
    @bike = bike
  end

end
