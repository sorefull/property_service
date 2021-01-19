# frozen_string_literal: true

module Api
  class PropertiesController < ActionController::API
    def index
      outcome = Properties::Find.run(permitted_params)

      if outcome.success?
        render json: outcome.result
      else
        render json: outcome.errors.message, status: 422
      end
    end

    private

    def permitted_params
      params.require(:properties).permit(:lat, :lng, :property_type, :offer_type)
    end
  end
end
