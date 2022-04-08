require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do 
      @user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test123", password_confirmation: "test123")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first name or last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
