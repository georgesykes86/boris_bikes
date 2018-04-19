require 'bike'

describe Bike do

  it {is_expected.to respond_to(:working?)}

  describe '#working' do
    let(:bike) {Bike.new}

    context 'when the bike is working' do
      before { bike.broken = false }
      it 'shows that it is working' do
        expect(bike.working?).to be true
      end

    end

    context 'when the bike is broken' do
      before { bike.broken = true }
      it 'shows that it is not working' do
        expect(bike.working?).to be false
      end

    end
  end

end
