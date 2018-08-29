class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.interest_level
    group(:level_of_interest)
    order(:level_of_interest, :asc)
    count
  end
end
