class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    super
  end
end
