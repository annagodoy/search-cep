require 'rails_helper'

RSpec.describe CepSearch do
  describe '.call' do 

    let(:params) { {} }

    subject(:interactor) { described_class.call(params) }

    context 'with valid params' do 
      let(:user) { create(:user)}

      let(:params) {{
        user: user,
        cep: '01310-300'
      }}

      before do
        interactor
      end

      it 'should search for cep and register on database' do
        expect(
          UserSearch.where(
            user_id: interactor.user.id, zip_code: interactor.cep)
        ).to exist
      end
    end

    context 'with invalid params' do
      context 'without user param' do 
        let(:params) {{
          cep: '01310-300'
        }}

        before do
          interactor
        end

        it 'should return an error' do
          expect(interactor.error).to match(/usuário inválido/)
        end
      end

      context 'without cep param' do 
        let(:user) { create(:user)}

        let(:params) {{
          user: user
        }}

        before do
          interactor
        end

        it 'should return an error' do
          expect(interactor.error).to match(/cep não pode ser vazio/)
        end
      end
    end
  end
end