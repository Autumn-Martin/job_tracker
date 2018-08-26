require 'rails_helper'

# describe 'User deletes existing job' do
#   scenario 'a user can delete a job' do
#     company = Company.create!(name: "Nintendo")
#     job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
#     visit company_job_path(company, job)
#
#     within(".job_#{job.id}") do
#       click_link "Delete"
#     end
#
#     expect(page).to have_content("Nintendo position was successfully deleted!")
#   end
# end

describe 'user deletes a job' do
  describe 'they link form the job index page' do
    it 'displays all jobs without the deleted entry' do
      company = Company.create!(name: "Nintendo")
      job = company.jobs.create!(title: "Graphic Designer", level_of_interest: 70, city: "Denver")

      visit company_jobs_path(company, job)
      save_and_open_page
      click_link "Delete"

      expect(current_path).to eq(company_job_path(company, job))
      expect(page).to have_content("Nintendo position was successfully deleted!")
      expect(page).to_not have_content(job.title)

    end
  end
end
