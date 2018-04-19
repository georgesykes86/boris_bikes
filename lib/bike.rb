class Bike

  attr_reader :broken

  def initialize(bike_status = true)
    @broken = bike_status
  end

  def working?
    !broken
  end

  def report_broken
    @broken = true
  end

end
