require './lib/docking_station'
require './lib/bike'

class DockingStationUnitTests


end

class BikeUnitTests

  def working?
    bike = Bike.new
    puts bike.working? ? "Success" : "Fail"
  end

end
