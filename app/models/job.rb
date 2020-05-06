class Job < ApplicationRecord
  belongs_to :person
  has_one :salary_range
end
