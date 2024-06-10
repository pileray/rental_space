# == Schema Information
#
# Table name: features
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_features_on_name  (name) UNIQUE
#
class Feature < ApplicationRecord
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
