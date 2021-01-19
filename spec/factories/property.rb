# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    offer_type { %w(sell rent).sample }
    property_type { %w(apartment apartment_roof_storey apartment_maisonette
                       penthouse villa multi_family_house single_family_house
                       mid_terrace_house semi_detached_house
                       end_terrace_house).sample }
    zip_code { (10000..99999).to_a.sample }
    city { 'Berlin' }
    street { 'Streetname' }
    house_number { (rand * 100).to_i }
    lat { (-90..89).to_a.sample.to_f }
    lng { (-180..179).to_a.sample.to_f }
    construction_year { (1880..2020).to_a.sample }
    number_of_rooms { (1..5).to_a.sample }
    currency { 'EUR' }
    price { (10000..99999).to_a.sample }
  end
end
