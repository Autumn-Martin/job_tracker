require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: 'Turing')
    job = company.jobs.create!(title: 'Software Dev', level_of_interest: 30, city: "Denver", category_id: "Crypto Dev")
    # job.category_id.title = "Crypto Dev"

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Chef"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Austin"

    click_button "Update"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    within ("#editjob") do
      expect(page).to have_content("Chef")
      expect(page).to have_content(80)
      expect(page).to have_content("Austin")
    end

    expect(page).to_not have_content("Software Dev")
    expect(page).to_not have_content(30)
    expect(page).to_not have_content("Denver")
  end
end
