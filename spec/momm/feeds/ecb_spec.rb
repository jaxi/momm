require 'spec_helper'

describe Momm::Feeds::ECB do
  context '#initialize' do
    it "cannot call new method do" do
      expect{
        Momm::Feeds::ECB.new
      }.to raise_error NoMethodError
    end

    it "should eager loading the ECB instance" do
      instance1 = Momm::Feeds::ECB.instance
      instance2 = Momm::Feeds::ECB.instance
      expect(instance1.object_id).to eq instance2.object_id
    end
  end

  describe ".currencies" do
    it 'should not be nil' do
      expect(Momm::Feeds::ECB::CURRENCIES).to be_a(Array)
    end
  end

  describe "#fetching_url" do
    it 'should not be nil' do
      expect(Momm::Feeds::ECB::FEED_URL).to be_a URI::HTTPS
    end
  end

  describe "#currency_rates" do
    let(:rates) { Momm::Feeds::ECB.instance.currency_rates }
    it 'should be an array' do
      expect(rates).to be_a Array
    end

    it 'should contain several elements' do
      expect(rates.length > 0).to eq true
    end

    it 'should contain :date, :currency and :rates' do
      expect(rates.all?{
        |rate| rate.has_key?(:date) &&
        rate.has_key?(:currency) &&
        rate.has_key?(:rate)
      }).to eq true
    end
  end
end
