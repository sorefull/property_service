# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property do
  describe '#with_type' do
    context 'when property_type and offer_type are nil' do
      it 'does not include them in the request' do
        expect(described_class.with_type({})).to_not include(*['property_type', 'offer_type'])
      end
    end
  end

  describe '#located' do
    subject { described_class.located(52.5166023, 13.3041054) }

    let(:data) do
      [
        ['52.5175344', '13.3059198'],   # close
        ['52.5175344', '13.3059198'],   # close
        ['52.5286911', '13.3757691'],   # close
        ['52.51442610', '13.40743300']  # far
      ]
    end

    before do
      data.each do |lat, lng|
        create(:property, lat: lat, lng: lng)
      end
    end

    context 'when properties are close enough' do

      it 'finds it' do
        expect(subject.count).to eq(3)
      end
    end
  end
end
