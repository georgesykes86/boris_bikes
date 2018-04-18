class Bike
  def working?
    true
  end

  def dock_bike
    @bikes.push(self)
  end
end
