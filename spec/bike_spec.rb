require 'bike'

describe Bike do

  describe '#working' do
    context 'when the bike is working' do
      it 'shows that it is working' do
        expect(subject).to be_working
      end

    end

    context 'when the bike is broken' do
      before { subject.broken = true }
      it 'shows that it is not working' do
        expect(subject).not_to be_working
      end

    end
  end

  describe '#report_broken' do
    it 'lets bike be reported as broken' do
      subject.report_broken
      expect(subject).not_to be_working
    end


  end

end
