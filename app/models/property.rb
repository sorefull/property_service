# frozen_string_literal: true

class Property < ApplicationRecord
  SEARCH_RADIUS = 5 * 1000 # 5 kilometers

  scope :located, lambda { |latitude, longitude|
    where(
      'earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(lat, lng)',
      latitude, longitude, SEARCH_RADIUS
    )
  }

  scope :with_type, lambda { |options|
    where(options.compact.slice(:property_type, :offer_type))
  }
end
