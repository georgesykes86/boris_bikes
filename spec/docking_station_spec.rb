require 'docking_station.rb'

describe DockingStation do

  it 'assigns station capacity on initialisation' do
    num = rand(50)
    station = DockingStation.new(num)
    expect(station.capacity).to eq num
  end

  it "defaults to default capacity (20)" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

describe 'docking bikes' do
  let(:docking_capacity) {DockingStation::DEFAULT_CAPACITY}
  it 'raises error if full (20)' do
    proc = Proc.new do
      (docking_capacity+1).times {subject.dock Bike.new}
    end
    expect {proc.call}.to raise_error("Bike station is full")
  end

  it 'when full returns array length 20' do
    docking_capacity.times {subject.dock Bike.new}
    expect(subject.bikes.length).to eq docking_capacity
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
end


  describe '#release_bike' do
    context "when there is a working bike" do
      it "releases bike" do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    context "when there is only one working bike amongst boken bikes" do
      it "releases the working bike" do
        working_bike = Bike.new
        broken_bike = Bike.new
        broken_bike.report_broken
        station = DockingStation.new(10)
        station.dock(broken_bike)
        station.dock(working_bike)
        station.dock(broken_bike)
        expect(station.release_bike).to eq working_bike
      end
    end

    context "when there isn't a working bike" do
      bike = Bike.new
      before do
        bike.broken = true
        subject.dock(bike)
      end
      it "doesn't release a bike" do
        expect {subject.release_bike}.to raise_error("No working bikes")
      end
    end

    it "releases new bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error if no bikes in dock' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end
end
