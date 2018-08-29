require 'rails_helper'

describe "User can update categories" do
  scenario "a can edit a category" do
    category = Category.create(title: "Cool Category")

    visit edit_category_path(category)

    fill_in "category[title]", with: "Neat Category"
    click_button "Update"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Neat Category")
    expect(page).to_not have_content("Cool Category")
  end

end
