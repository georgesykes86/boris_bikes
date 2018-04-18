require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}



  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it "releases new bike" do
      bike = Bike.new
      subject.dock(bike)

      expect(subject.release_bike).to eq bike
    end

    it 'raises error if bike has not been dock' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end
end
