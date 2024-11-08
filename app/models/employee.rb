class Employee < ApplicationRecord
  attr_accessor :skip_password_validation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validations
  validates :name, :position, :avatar, presence: true

  # Associations
  belongs_to :department, counter_cache: true

  has_many :reports, class_name: "Employee",
                     foreign_key: "manager_id",
                     dependent: :nullify,
                     inverse_of: "manager"

  belongs_to :manager, class_name: "Employee",
                       optional: true

  # ActiveStorage
  has_one_attached :avatar

  private

  def password_required?
    return false if skip_password_validation
  end
end
