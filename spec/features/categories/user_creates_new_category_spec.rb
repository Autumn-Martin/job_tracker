require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    
    visit categories_path

    click_link 'Create New Category'

    fill_in "category[title]", with: "Development"
    click_button "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Development")
  end
end
