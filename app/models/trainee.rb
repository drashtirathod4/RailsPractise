class Trainee < ApplicationRecord
    belongs_to :city
    has_many :addresses, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true
    validates_presence_of :name, :email, :address, :gender, :hobbies, :city_id
    has_one_attached :image
end
