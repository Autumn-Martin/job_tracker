require 'rails_helper'

describe Comment do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        comment = Comment.new()

        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content' do
        company = Company.create(name: "Dropbox")
        job_1 = company.jobs.create(title: "Software", city: "Denver", company_id: company.id, level_of_interest: 70, description: "Wahooo")
        comment = Comment.new(content: 'here is some cool content', job_id: job_1.id)

        expect(comment).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to jobs' do
      job = Job.create(title: "Software", city: "Denver", company_id: 1, level_of_interest: 70, description: "Wahooo")
      comment = Comment.create(content: 'here is some cool content', job_id: job.id)

      expect(comment).to respond_to(:job)
    end
  end
end
