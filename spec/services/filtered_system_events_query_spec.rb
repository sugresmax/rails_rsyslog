require 'rails_helper'

RSpec.describe FilteredSystemEventsQuery, type: :module do
  let!(:ip_addresses) { 10.times.map { FFaker::Internet.ip_v4_address } }
  let!(:fromhost) { create_list(:system_event, 100) }

  %w[fromhost fromhost_ilike syslogtag facility message message from_time till_time].each do |item|
    it "returns relation if #{item}_value is blank" do
      expect(described_class.new(SystemEvent.all, { item => '' }).call).to eq SystemEvent.all
    end
  end
  describe '#by_fromhost' do
    it 'returns number of items equal to query' do
      ip_address = ip_addresses.sample
      expect(described_class.new(SystemEvent.all, { fromhost: ip_address }).call)
        .to eq(SystemEvent.where(fromhost: ip_address))
    end
  end

  describe '#by_fromhost_ilike' do
    it 'returns number of items equal to query' do
      ip_address = ip_addresses.sample.split('.').first(3).join('.')
      expect(described_class.new(SystemEvent.all, { fromhost_ilike: ip_address }).call)
        .to eq(SystemEvent.where('fromhost ILIKE ?', "%#{ip_address}%"))
    end
  end

  describe '#by_syslogtag' do
    it 'returns number of items equal to query' do
      syslogtag = SystemEvent.first.syslogtag
      expect(described_class.new(SystemEvent.all, { syslogtag: syslogtag }).call)
        .to eq(SystemEvent.where('syslogtag ILIKE ?', "%#{syslogtag}%"))
    end
  end

  describe '#by_facility' do
    it 'returns number of items equal to query' do
      facility = SystemEvent.first.facility
      expect(described_class.new(SystemEvent.all, { facility: facility }).call)
        .to eq(SystemEvent.where(facility: facility))
    end
  end

  describe '#by_message' do
    it 'returns number of items equal to query' do
      message = SystemEvent.first.message.slice(0, 10)
      expect(described_class.new(SystemEvent.all, { message: message }).call)
        .to eq(SystemEvent.where('message ILIKE ?', "%#{message}%"))
    end
  end

  describe '#by_from_time' do
    it 'returns number of items equal to query' do
      from_time = SystemEvent.first.receivedat
      expect(described_class.new(SystemEvent.all, { from_time: from_time }).call)
        .to eq(SystemEvent.where('receivedat >= ?', from_time))
    end
  end

  describe '#by_till_time' do
    it 'returns number of items equal to query' do
      till_time = SystemEvent.first.receivedat
      expect(described_class.new(SystemEvent.all, { till_time: till_time }).call)
        .to eq(SystemEvent.where('receivedat <= ?', till_time))
    end
  end
end
