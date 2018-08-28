require 'rails_helper'

describe 'User sees all comments for a job' do
  describe 'when user visits job/show page' do
    it 'shows all comments for a job' do
      company = Company.create(name: 'NASA')
      job = company.jobs.create!(title: "Astronaut", level_of_interest: 80, city: "Denver")
      comment_1 = job.comments.create!(content: "Let's go to mars!")
      comment_2 = job.comments.create!(content: "I wonder what Jupiter is like.")

      visit job_path(job)

      expect(page).to have_content(comment_1)
      expect(page).to have_content(comment_2)
    end
  end
end
