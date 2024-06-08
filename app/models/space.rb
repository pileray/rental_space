# == Schema Information
#
# Table name: spaces
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  despcription    :text(65535)      not null
#  latitude        :float(24)
#  longitude       :float(24)
#  name            :string(255)      not null
#  nearest_station :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Space < ApplicationRecord
  has_many :space_type_mappings
  has_many :space_types, through: :space_type_mappings
  has_many :feature_mappings
  has_many :features, through: :feature_mappings
  has_many_attached :images
  validates :name, presence: true
end
