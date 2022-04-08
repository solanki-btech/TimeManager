require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'new' do
    before do 
      visit new_post_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it "can be filled with values" do 
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Rationale post"

      click_on "Save"

      expect(page).to have_content("Rationale post")
    end
  end
end 