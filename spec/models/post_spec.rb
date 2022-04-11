require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do 
      user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test123", password_confirmation: "test123")
      @post = Post.create(date: Date.today, rationale: "First Post", user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created with nil values" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
