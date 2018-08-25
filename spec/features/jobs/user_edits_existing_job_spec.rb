require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: 'Turing')
    category = Category.create!(title: "Crypto Dev")
    job = company.jobs.create!(title: 'Software Dev', level_of_interest: 3, city: "Denver", category_id: category.id)
    # job.category_id.title = "Crypto Dev"
    visit company_path(company)
    click_link "Edit"

    expect(current_path).to eq(edit_company_job_path(company, job))
    # visit edit_company_job_path(company, job)
    # select "job[category]", from: 'category-dropdown'
    fill_in "job[title]", with: "Chef"
    select "job[level_of_interest]", from: 'interest-dropdown'
    fill_in "job[city]", with: "Austin"

    click_button "Update"

    # expect(current_path).to eq("company/#{company.id}/jobs/#{job.id}")
    # within ("#editjob") do
    #   expect(page).to have_content("Chef")
    #   expect(page).to have_content(80)
    #   expect(page).to have_content("Austin")
    # end

    expect(page).to_not have_content("Software Dev")
    expect(page).to_not have_content(30)
    expect(page).to_not have_content("Denver")
  end
end
