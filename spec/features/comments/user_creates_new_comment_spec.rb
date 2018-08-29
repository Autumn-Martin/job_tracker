require 'rails_helper'

describe 'User creates a new comment' do
  describe 'when user visits /job/show' do
    describe 'user fills in notes form' do
      describe 'user clicks on save' do
        it 'creates a new comment' do
          company = Company.create(name: 'NASA')
          job = company.jobs.create!(title: "Astronaut", level_of_interest: 80, city: "Denver")
          comment_1 = job.comments.create!(content: "Let's go to mars!")
          comment_2 = job.comments.create!(content: "I wonder what Jupiter is like.")

          visit job_path(job)
          
          fill_in "comment[content]", with: "Moonwalk"
          click_on "Save"

          expect(page).to have_content("Moonwalk")
        end
      end
    end
  end
end
