# == Schema Information
#
# Table name: spaces
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  description     :text(65535)      not null
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

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "description", "id", "latitude", "longitude", "name", "nearest_station", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["feature_mappings", "features", "images_attachments", "images_blobs", "space_type_mappings", "space_types"]
  end

  def main_image
    images.first || 'http://placehold.jp/300x200.png'
  end
end
