# frozen_string_literal: true

class PropertySerializer
  ALLOWED_ATTRIBUTES = %w(house_number street city zip_code state lat lng price)

  def initialize(resources)
    @properties = resources
  end

  def serialize
    @properties.map do |property|
      property.attributes.slice(*ALLOWED_ATTRIBUTES)
    end
  end
end
