require 'rails_helper'

RSpec.describe LogEventsRepo do
  subject { described_class.new }

  describe '#log' do
    it 'logs a message to the Rails logger' do
      allow(Rails.logger).to receive(:info).and_call_original
      subject.log(:create, {something: 'heydude'} )

      expected = 'EVENT: {"type":"create","object":{"something":"heydude"}}'
      expect(Rails.logger).to have_received(:info).with(expected)
    end
  end
end
