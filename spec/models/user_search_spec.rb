require 'rails_helper'

RSpec.describe UserSearch, type: :model do
  context 'Validations' do

    it 'is valid with valid attributes' do
      search = create(:user_search)

      expect(
        search
      ).to be_valid
    end

    it 'is not valid without an user_id' do
      search = build(:user_search, user_id: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without an address' do
      search = build(:user_search, address: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a street' do
      search = build(:user_search, street: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a neighborhood' do
      search = build(:user_search, neighborhood: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a zip_code' do
      search = build(:user_search, zip_code: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a city' do
      search = build(:user_search, city: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a state' do
      search = build(:user_search, state: '')

      expect {
        search.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
