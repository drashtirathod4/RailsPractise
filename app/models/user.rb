class User < ApplicationRecord
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

  before_save :normalize_name, :remove_whitespaces, if: :name?

  def normalize_name
    self.name = name.titleize
  end

  def remove_whitespaces
    self.name = name.strip!
  end

  after_save do
    puts "User Saved!"
  end

  after_update do
    puts "User updated"
  end

  after_destroy do
    puts "Task Deleted!"
  end

  after_initialize do |task|
      puts "Object Initialized"
  end

  after_find do |task|
      puts "object found..."
  end

  after_touch do |task|
      puts "You have touched an object"
  end
end
