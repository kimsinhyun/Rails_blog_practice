class User < ApplicationRecord
  include Users::Onboardable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient
  has_one :address, dependent: :destroy, inverse_of: :user, autosave: true

  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?
  # User.new(name: '...', address_attributes: { ... }) 를 위한 부분
  accepts_nested_attributes_for :address, :allow_destroy => true


  def self.ransackable_associations(auth_object = nil)
    %w[comments notifications posts]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id name updated_at views]
  end

  def full_name
    "#{first_name.capitalize unless first_name.nil?} #{last_name.capitalize unless last_name.nil?}"
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
