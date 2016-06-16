class Page < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :date_time, presence: true
  validates :page, presence: true
end
