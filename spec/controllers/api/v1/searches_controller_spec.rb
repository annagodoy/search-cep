require 'rails_helper'

RSpec.describe Api::V1::SearchesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET search_cep' do 
  
    context 'with valid params' do
      before do 
        login(user)
      end

      it 'should return a successful status' do
        user_token = User.find(session['user_id']).api_token

        get :search_cep, params: { cep: '03417000', token: user_token }

        expect(response.status).to eq(200)
      end
    end

    context 'with invalid params' do 
      it 'should return a successful status' do
        get :search_cep, params: { cep: '03417000', token: '' }

        expect(response.status).to eq(401)
      end
    end
  end
end