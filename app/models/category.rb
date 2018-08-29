class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :jobs

  def job_count
    jobs.count
  end
end
