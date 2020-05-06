class Hobby < ApplicationRecord
  has_and_belongs_to_many :people

  default_scope {
    order :name
  }
end
