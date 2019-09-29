require 'rails_helper'

RSpec.describe "Token Validations", type: :request do
  describe 'Staff' do
    describe 'signed in' do
      let(:staff) { create :staff }
      let(:auth_headers) { staff.create_new_auth_token }
      sign_in(:staff)

      it 'should respond with success' do
        get '/api/v1/staff_auth/validate_token'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'signed out' do
      it 'should respond with unauthorized' do
        get '/api/v1/staff_auth/validate_token'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'Client' do
    describe 'signed in' do
      let(:client) { create :client }
      let(:auth_headers) { client.create_new_auth_token }
      sign_in(:client)

      it 'should respond with success' do
        get '/api/v1/client_auth/validate_token'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'signed out' do
      it 'should respond with unauthorized' do
        get '/api/v1/client_auth/validate_token'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
