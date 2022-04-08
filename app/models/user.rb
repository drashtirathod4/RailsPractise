class User < ApplicationRecord
  has_secure_password
  has_many :userarticles
  has_many :articles
  has_many :events
  validates_presence_of :name, :email, :phone, :dob, :password, :course, :start_date, :end_date
  validates :email, uniqueness: true
  validates :password, confirmation: true, length: { within: 6..15 }, on: :create
  validates :password, confirmation: true, length: { within: 6..15 }, on: :update
  validates :password_confirmation, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
  validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
  validate :dob_cannot_be_in_the_future
  validates :agreement, acceptance: {message: ": You cannot proceed without accepting Terms & Conditions!" }, allow_nil: false

  validates :course, inclusion: {in: %w{Python ROR}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.course.blank? }
  validate :end_after_start

  def dob_cannot_be_in_the_future
      if dob.present? && dob > Date.today
        errors.add(:dob, "Birthdate can't be in future!")
      end
  end

  def end_after_start
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date") 
    end 
  end
end
