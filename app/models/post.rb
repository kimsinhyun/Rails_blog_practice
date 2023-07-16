class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :body, presence: true, length: { minimum: 10, maximum: 50 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    ["title", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    super
  end
end
