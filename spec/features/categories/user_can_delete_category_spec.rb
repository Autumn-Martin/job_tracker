require 'rails_helper'

describe "User can update categories" do
  scenario "a can edit a category" do
    category = Category.create(title: "Cool Category")

    visit categories_path

    click_link "Delete"

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content("Cool Category")
  end

end
