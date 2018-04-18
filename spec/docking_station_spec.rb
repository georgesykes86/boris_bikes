require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it {is_expected.to respond_to(:dock).with(1).argument}

describe 'docking bikes' do

  it 'raises error if full (20)' do
    proc = Proc.new do
      21.times {subject.dock Bike.new}
    end
    expect {proc.call}.to raise_error("Bike station is full")
  end

  it 'when full returns array length 20' do
    20.times {subject.dock Bike.new}
    expect(subject.bikes.length).to eq 20
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
end

  describe '#release_bike' do
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
