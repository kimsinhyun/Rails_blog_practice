class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :body, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :notifications, through: :user, dependent: :destroy
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  has_rich_text :body


  def self.ransackable_attributes(auth_object = nil)
    %w[title content body]
  end

  def self.ransackable_associations(auth_object = nil)
    super
  end
end
