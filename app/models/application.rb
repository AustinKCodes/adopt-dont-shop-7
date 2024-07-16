class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :status, presence: true
    enum status: ["In Progress", "Pending", "Accepted", "Rejected"]
    
  has_many :application_pets
  has_many :pets, through: :application_pets
end