require 'rails_helper'
require 'pry'

RSpec.describe 'Routes', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:new_route) { FactoryBot.build(:route) }

      before do
        post '/api/v1/routes', params: {
          route: {
            name: new_route.name,
            active: new_route.active
          }
        }
      end

      it 'returns the name' do
        expect(json[:route][:name]).to eq(new_route.name)
      end

      it 'returns the activation status' do
        expect(json[:route][:active]).to eq(new_route.active)
      end

      it 'returns a created status (201)' do
        expect(response).to have_http_status(:created)
      end
    end
    context 'with invalid parameters' do
      let!(:new_invalid_route) { FactoryBot.build(:invalid_route) }

      before do
        post '/api/v1/routes', params: {
          route: {
            name: new_invalid_route.name,
            active: false
          }
        }
      end

      it 'returns a unprocessable entity status (422)' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'returns name too short validation error' do
        expect(json[:errors]).to contain_exactly("Name is too short (minimum is 3 characters)")
      end
    end
  end
end