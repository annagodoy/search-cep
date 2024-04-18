require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do

    it 'is valid with valid attributes' do
      user = create(:user)

      expect(
        user
      ).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: '')

      expect {
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a password' do 
      user = build(:user, password: '')

      expect {
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should have a unique email' do
      user = create(:user)

      new_user = build(:user, email: user.email)

      expect {
        new_user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
