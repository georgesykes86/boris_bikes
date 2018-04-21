require 'docking_station.rb'

describe DockingStation do

  describe '#initialise' do
    it 'assigns station capacity on initialisation' do
      num = rand(50)
      station = DockingStation.new(num)
      expect(station.capacity).to eq num
    end

    it "defaults to default capacity (20)" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#dock' do
    let(:docking_capacity) {DockingStation::DEFAULT_CAPACITY}
    let(:bike) { instance_double('Bike') }
    it 'raises error if full (20)' do
      proc = Proc.new do
        (docking_capacity+1).times {subject.dock bike}
      end
      expect {proc.call}.to raise_error("Bike station is full")
    end

    it 'when full returns array length 20' do
      docking_capacity.times {subject.dock bike}
      expect(subject.bikes.length).to eq docking_capacity
    end

    it 'docks a bike' do
      subject.dock bike
      expect(subject.bikes).to include bike
    end
  end


  describe '#release_bike' do
    let(:working_bike) { instance_double('Bike', working?: true) }
    let(:broken_bike) { instance_double('Bike', working?: false) }

    context "when there is a working bike" do
      before {subject.dock(working_bike)}

      it "releases bike" do
        expect(subject.release_bike).to eq working_bike
      end
    end

    context "when there isn't a working bike" do
      before { subject.dock(broken_bike) }
      it "doesn't release a bike" do
        expect {subject.release_bike}.to raise_error("No working bikes")
      end
    end


    it 'raises error if no bikes in dock' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end


    context "when there is only one working bike amongst boken bikes" do
      it "releases the working bike" do
        station = DockingStation.new(10)
        bikes = [broken_bike, working_bike, broken_bike]
        bikes.each { |bike| station.dock(bike) }
        expect(station.release_bike).to eq working_bike
      end
    end
  end

end
