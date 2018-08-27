require 'rails_helper'

describe 'user deletes a job' do
  describe 'they link from the job index page' do
    it 'displays all jobs without the deleted entry' do
      company = Company.create!(name: "Nintendo")
      job = company.jobs.create!(title: "Graphic Designer", level_of_interest: 70, city: "Denver")

      visit jobs_path(job)

      click_link "Delete"

      expect(current_path).to eq(jobs_path(job))
      expect(page).to have_content("Job was successfully deleted!")
      expect(page).to_not have_content(job.title)

    end
  end
end
