class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient

  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?


  def self.ransackable_associations(auth_object = nil)
    %w[comments notifications posts]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id name updated_at views]
  end


  private

  def set_default_role
    self.role ||= :user
  end

end
