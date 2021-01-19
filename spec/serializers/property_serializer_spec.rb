# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PropertySerializer do
  subject { described_class.new(properties).serialize }

  let(:properties) { [property1, property2, property3] }

  let(:property1) { create(:property) }
  let(:property2) { create(:property) }
  let(:property3) { create(:property) }

  it 'only includes allowed attributes' do
    expect(subject.first.keys).not_to include(:id, :offer_type, :property_type,
                                              :construction_year,
                                              :number_of_rooms, :currency)
  end
end
