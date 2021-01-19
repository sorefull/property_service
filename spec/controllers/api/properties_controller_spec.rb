# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PropertiesController do
  subject { get :index, params: { properties: { lat: 'lat', lng: 'lng'} } }

  before do
    allow(Properties::Find).to receive(:run) { outcome }

    subject
  end

  let(:outcome) do
    double('Find', success?: success?, result: result, errors: errors)
  end
  let(:errors) { double('Errors', message: 'message') }
  let(:result) { 'result' }

  context 'when the outcome is successfull' do
    let(:success?) { true }

    it 'redners json' do
      expect(response.content_type).to include('application/json')
    end

    it 'returns 200' do
      expect(response.code).to eq('200')
    end
  end
  context 'when the outcome is not successfull' do
    let(:success?) { false }

    it 'renders error message' do
      expect(response.body).to include(errors.message)
    end

    it 'returns 200' do
      expect(response.code).to eq('422')
    end
  end
end
