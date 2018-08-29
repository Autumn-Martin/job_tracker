require 'rails_helper'

describe "User sees all jobs for one city" do
  scenario "a user sees all the jobs for a specific city" do
    company = Company.create!(name: "NASA")
    category = Category.create(title: "Graphic Design")
    job_1 = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company)
    job_2 = Job.create(title: "Astronaut", level_of_interest: 30, city: "Denver", company: company)
    job_3 = Job.create(title: "Senior Dev", level_of_interest: 20, city: "L.A.", company: company)
    job_4 = Job.create(title: "Junior Dev", level_of_interest: 20, city: "L.A.", company: company)

    visit '/jobs?location=Denver'

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_3.title)
    expect(page).to_not have_content(job_4.title)

    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to_not have_content(job_3.level_of_interest)
    expect(page).to_not have_content(job_4.level_of_interest)

    expect(page).to have_content(job_1.city)
    expect(page).to have_content(job_2.city)
    expect(page).to_not have_content(job_3.city)
    expect(page).to_not have_content(job_4.city)
  end
end
