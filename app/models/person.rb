class Person < ApplicationRecord
  has_one :personal_info, dependent: :destroy
  has_many :jobs
  has_and_belongs_to_many :hobbies
  has_many :approx_sallary, through: :jobs, source: :salary_range

  def max_salary
    return approx_sallary.maximum(:max_salary)
  end

  scope :ordered_by_age, -> {order age: :desc}
  scope :starts_with, ->(str) { where("first_name like :first_name", {first_name: "#{str}%"})}
end
