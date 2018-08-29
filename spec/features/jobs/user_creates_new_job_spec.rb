require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: "Finance")
    company = Company.create!(name: "ESPN")
    # job = company.jobs.create!(title: 'Software Dev', description: 'make sweet apps', level_of_interest: 3, city: "Denver", category_id: category.id )

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    select 5, from: "job[level_of_interest]"
    select "Finance", from: "job[category_id]"
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content(5)
    expect(page).to have_content("Finance")
    expect(page).to have_content("Denver")
  end
end
