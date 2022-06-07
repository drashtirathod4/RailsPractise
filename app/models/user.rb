class User < ApplicationRecord
  validates_presence_of :name, :email, :phone, :dob, :course, :start_date, :end_date
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
  validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
  validate :dob_cannot_be_in_the_future
  validates :agreement, acceptance: {message: ": You cannot proceed without accepting Terms & Conditions!" }, allow_nil: false

  validates :course, inclusion: {in: %w{Python ROR}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.course.blank? }
  validate :end_after_start

  # define attributes inside searchable class(which you want to search by) so that it knows what to index
  searchable do
    # text to define full-text searchable attributes!
    # boost is for providing a value such as 5 and it will mean that any keywords found in the name of the user will be five times more important than the keywords inside the email
    text :name, boost: 5
    text :email, :birth_year
    string :dob
    integer :score
  end

  def birth_year 
    dob.strftime("%B %Y")
  end

  # sunspot will automatically index any new records that you create however if you have some existing records already ..
  # in the database you'll need to reindex those & you can do that by calling rake sunspot:reindex to include those & make them searchable!

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
