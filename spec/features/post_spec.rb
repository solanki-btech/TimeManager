require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do 
      user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test123", password_confirmation: "test123")
      login_as user, scope: :user

      visit new_post_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do 
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Rationale post"

      click_on "Save"

      expect(page).to have_content("Rationale post")
    end

    it "will have a user associated with it" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "User associated to post"

      click_on "Save"

      expect(User.last.posts.last.rationale).to have_content("User associated")
    end

  end
end 