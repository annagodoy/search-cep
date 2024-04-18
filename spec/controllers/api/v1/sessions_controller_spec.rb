require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  let(:user) { create(:user) }

  describe 'POST /sessions' do 
    context 'with valid credentials' do
      it 'should return a successful status' do
       
        post :create, params: { email: user.email, password: user.password }
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['status']).to eq('logged')
      end
    end

    context 'with invalid credentials' do
      it 'should return an error status' do

        post :create, params: { email: user.email, password: 'password'}
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['status']).to eq(401)
      end
    end
  end

  describe 'GET /logged_in' do
    context 'if user is logged' do 
      before do 
        post :create, params: { email: user.email, password: user.password }
      end

      it 'should return a successful status ' do
        get :logged_in
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['logged_in']).to eq(true)
      end
    end

    context 'if user is logged' do 
      it 'should return a successful status ' do
        get :logged_in
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['logged_in']).to eq(false)
      end
    end

  end

  describe 'DELETE /logout' do
    before do 
      post :create, params: { email: user.email, password: user.password }
    end

    it 'should logout' do
      delete :logout
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['logged_out']).to eq(true)
    end
  end
end
