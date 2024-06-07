class Space < ApplicationRecord
  has_many :space_type_mappings
  has_many :space_types, through: :space_type_mappings
  validates :name, presence: true
end
