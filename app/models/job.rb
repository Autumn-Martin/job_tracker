class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.sort_jobs(sort_by)
    if sort_by == 'interest'
      order('level_of_interest DESC')
    elsif sort_by == 'city'
      order('city ASC')
    end
  end

  def self.group_jobs_by_city(city)
    where(city: city)
  end

  def self.group_by_interest
    Job.order(level_of_interest: :desc)
       .group(:level_of_interest)
       .count.first(3)
  end

  def self.group_by_city
    Job.group(:city)
       .order("count_all DESC")
       .count.first(3)
  end
end
