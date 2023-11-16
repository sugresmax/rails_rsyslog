require 'rails_helper'

RSpec.describe SystemeventHelper, type: :helper do
  let(:system_event) { build(:system_event) }

  describe '#system_event_tag' do
    it 'returns tags' do
      system_event.syslogtag.split(',').each do |tag|
        expect(helper.system_event_tags(system_event))
          .to include(tag)
      end
    end
  end

  describe '#system_event_classes' do
    context 'when syslogtag is empty' do
      let(:system_event) { build(:system_event, syslogtag: '') }

      it 'returns nothing' do
        expect(helper.system_event_classes(system_event)).to eq []
      end
    end

    context 'when syslogtag is not empty' do
      let(:syslogtag) { %w[emergency alert critical error warning notice debug].sample }
      let(:system_event) { build(:system_event, syslogtag: syslogtag) }

      it 'returns array of system event classes' do
        expect(helper.system_event_classes(system_event).class).to eq Array
      end

      it 'system event classes includes syslogtag' do
        expect(helper.system_event_classes(system_event).join(',')).to include(syslogtag)
      end
    end
  end

  describe '#facilities' do
    it 'returns array of all available facilities' do
      expect(helper.facilities.class).to eq Array
    end
  end
end
