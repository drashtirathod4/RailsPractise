class MyUser < ApplicationRecord
  rolify
    has_secure_password
    has_many :links, dependent: :destroy
    has_many :my_reviews, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    after_create :assign_default_role

    def assign_default_role
        self.add_role(:newuser) if self.roles.blank?
    end

    def admin?
        self.has_role? :admin
    end
end
