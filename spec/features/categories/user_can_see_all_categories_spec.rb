require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_1 = Category.create(title: "Cool Category")
    category_2 = Category.create(title: "Neato")

    visit categories_path

    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_2.title)
  end

end
