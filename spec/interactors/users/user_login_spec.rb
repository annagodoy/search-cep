require 'rails_helper'

RSpec.describe Users::UserLogin do
  describe '.call' do 

    let(:params) { {} }

    subject(:interactor) { described_class.call(params) }

    context 'valid credentials' do
      let(:user) { create(:user) }

      let(:params) {{
          email: user.email, 
          password: user.password 
      }}

      before do
        interactor
      end

      it 'should authorize login and generate token' do
        expect(interactor.success?).to be true
      end
    end

    context 'invalid credentials' do 
      context 'user not found' do
        let(:params) {{
            email: 'email@email.com', 
            password: '1234567890'
        }}

        before do
          interactor
        end

        it 'should not authorize login and do not generate token' do
          expect(interactor.error).to match(/usuário não encontrado!/)
        end 
      end 

      context 'incorrect password' do
        let(:user) { create(:user) }

        let(:params) {{
          email: user.email, 
          password: 'password'
        }}

        before do
          interactor
        end

        it 'should not authorize login and do not generate token' do
          expect(interactor.error).to match(/senha incorreta!/)
        end 
      end
    end
  end 
end