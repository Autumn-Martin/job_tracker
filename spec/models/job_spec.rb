require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe "class methods" do
    it ".sort_jobs" do
      company = Company.new(name: "Turing")
      job_1 = Job.create(title: "Developer", level_of_interest: 40, city: "Vancouver", company: company)
      job_2 = Job.create(title: "Developer", level_of_interest: 30, city: "Denver", company: company)
      job_3 = Job.create(title: "Developer", level_of_interest: 20, city: "L.A.", company: company)
      job_4 = Job.create(title: "Developer", level_of_interest: 20, city: "L.A.", company: company)
      job_5 = Job.create(title: "Developer", level_of_interest: 10, city: "Kansas City", company: company)
      job_6 = Job.create(title: "Developer", level_of_interest: 10, city: "L.A.", company: company)


      expect(Job.sort_jobs('interest')).to eq([job_1, job_2, job_3, job_4, job_5, job_6])
      expect(Job.sort_jobs('city')).to eq([job_2, job_5, job_3, job_4, job_6, job_1])
    end

    it ".group_jobs_by_city" do
      company = Company.new(name: "Turing")
      job_1 = Job.create(title: "Developer", level_of_interest: 40, city: "Vancouver", company: company)
      job_2 = Job.create(title: "Developer", level_of_interest: 30, city: "Denver", company: company)
      job_3 = Job.create(title: "Developer", level_of_interest: 20, city: "L.A.", company: company)
      job_4 = Job.create(title: "Developer", level_of_interest: 20, city: "L.A.", company: company)
      job_5 = Job.create(title: "Developer", level_of_interest: 10, city: "Kansas City", company: company)
      job_6 = Job.create(title: "Developer", level_of_interest: 10, city: "L.A.", company: company)

      expect(Job.group_jobs_by_city('L.A.')).to eq([job_3, job_4, job_6])
    end

  end
end
