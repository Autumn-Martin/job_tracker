require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: 'Turing')
    old_category = Category.create!(title: "Crypto Dev")
    new_category = Category.create!(title: "Video Game Dev")
    job = company.jobs.create!(title: 'Software Dev', level_of_interest: 3, city: "Denver", category_id: old_category.id)

    visit company_jobs_path(company)

    click_link "Edit"

    expect(current_path).to eq(edit_job_path(job))

    # select "Video Game Dev", from: 'job[category]'
    fill_in "job[title]", with: "Chef"
    select 2, from: 'job[level_of_interest]'
    fill_in "job[city]", with: "Austin"

    click_button "Update"

    expect(page).to have_content("Chef")
    expect(page).to have_content("Austin")
    expect(page).to have_content(2)
    # expect(page).to have_content(new_category.title)

    # expect(page).to_not have_content(old_category.title)
    expect(page).to_not have_content("Software Dev")
    expect(page).to_not have_content(30)
    expect(page).to_not have_content("Denver")
  end
end
