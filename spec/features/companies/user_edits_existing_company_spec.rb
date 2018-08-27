require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company_id: company.id)
    visit edit_company_path(company)

    fill_in "company[name]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq(companies_path)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end
end
