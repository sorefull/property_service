# frozen_string_literal: true

module Properties
  class Find < Mutations::Command
    ALLOWED_OFFER_TYPES = %w(sell rent).freeze
    ALLOWED_PROPERTY_TYPES = %w(apartment apartment_roof_storey
                                apartment_maisonette penthouse villa
                                multi_family_house single_family_house
                                mid_terrace_house semi_detached_house
                                end_terrace_house).freeze

    required do
      float :lat, min: -90, max: 90
      float :lng, min: -180, max: 180
    end

    optional do
      string :property_type, in: ALLOWED_PROPERTY_TYPES
      string :offer_type, in: ALLOWED_OFFER_TYPES
    end

    def execute
      PropertySerializer.new(properties).serialize
    end

    private

    def properties
      Property
        .with_type(property_type: property_type, offer_type: offer_type)
        .located(lat, lng)
    end
  end
end
