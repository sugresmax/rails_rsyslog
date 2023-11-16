require 'rails_helper'

RSpec.describe SystemEventPresenter, type: :presenter do
  let!(:system_event) { build(:system_event) }
  let!(:system_event_present) { SystemEventPresenter.new(system_event) }

  describe '.received_at' do
    it 'returns formatted date, time' do
      expect(system_event_present.received_at).to eq(I18n.l(system_event.receivedat, format: :long))
    end
  end

  describe '.device_reported_time' do
    it 'returns formatted date, time' do
      expect(system_event_present.device_reported_time).to eq(I18n.l(system_event.devicereportedtime, format: :long))
    end
  end

  describe '.facility' do
    it 'returns translated value' do
      expect(system_event_present.facility).to eq(I18n.t("facility.#{system_event.facility}"))
    end
  end
end
