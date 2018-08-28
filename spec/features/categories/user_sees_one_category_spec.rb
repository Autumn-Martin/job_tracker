require 'rails_helper'

describe "User sees a category job" do
  scenario "a user sees a jobs for a specific category" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    job_1 = company.jobs.create!(title: "Front End Dev", description: "pretty stuff", level_of_interest: 4, city: "Boulder", category_id: category.id)
    job_2 = company.jobs.create!(title: "Full Stack Dev", description: "all the things", level_of_interest: 3, city: "Denver", category_id: category.id)

    visit categories_path

    click_link(category.title)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_1.city)
    expect(page).to have_content(job_1.company.name)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_2.city)
    expect(page).to have_content(job_2.company.name)
  end
end
