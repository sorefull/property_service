# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Properties::Find do
  subject { described_class.run(params) }

  let(:params) do
    {
      lat: lat,
      lng: lng,
      property_type: property_type,
      offer_type: offer_type
    }
  end

  let(:property_type) { nil }
  let(:offer_type) { nil }

  context 'when params are wrong' do
    let(:lat) { 0 }
    let(:lng) { 0 }

    context 'when lat is wrong' do
      let(:lat) { [-99, 99, 'XYZ'].sample }

      it { expect(subject.success?).to be_falsey }
    end

    context 'when lng is wrong' do
      let(:lat) { [-188, 188, 'XYZ'].sample }

      it { expect(subject.success?).to be_falsey }
    end

    context 'when property_type is wrong' do
      let(:property_type) { 'XYZ' }

      it { expect(subject.success?).to be_falsey }
    end

    context 'when offer_type is wrong' do
      let(:offer_type) { 'XYZ' }

      it { expect(subject.success?).to be_falsey }
    end
  end

  context 'when params are right' do
    let!(:property) { create(:property) }
    let(:lat) { property.lat.to_f }
    let(:lng) { property.lng.to_f }

    let(:serialized_property) do
      PropertySerializer.new([property]).serialize.first
    end

    it { expect(subject.success?).to be_truthy }

    it 'finds right properties' do
      expect(subject.result).to include(serialized_property)
    end
  end
end
