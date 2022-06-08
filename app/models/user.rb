class User < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :email]
  pg_search_scope :search_by_name, against: :name
  pg_search_scope :search, against: [:name, :email, :phone],
    using: {tsearch: {dictionary: "english"}},
    ignoring: :accents
    # To search against associated models
    # associated_against: {author: :name, comments: [:name, :content]}

  def self.text_search(query)
    if query.present?
      # search(query)
      # rank takes more time to search than simple search
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize_sql(query)}))
      RANK
      # plainto_tsquery lets us search words with space while to_tsquery will give us error if we try to search words with space!
      # where("to_tsvector(name || ' ' || email || ' ' || phone) @@ plainto_tsquery(:q)", q: query).order(Arel.sql("name DESC"))
      where("to_tsvector('english', name) @@ plainto_tsquery(:q) or to_tsvector('english', email) @@ plainto_tsquery(:q) or to_tsvector('english', phone) @@ plainto_tsquery(:q)", q: query).order(Arel.sql("name DESC"))
    else
      User.all
    end
  end

  # validates_presence_of :name, :email, :phone, :dob, :course, :start_date, :end_date
  # validates :email, uniqueness: true
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
  # validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
  # validate :dob_cannot_be_in_the_future
  # validates :agreement, acceptance: {message: ": You cannot proceed without accepting Terms & Conditions!" }, allow_nil: false

  # validates :course, inclusion: {in: %w{Python ROR}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.course.blank? }
  # validate :end_after_start

  # def dob_cannot_be_in_the_future
  #     if dob.present? && dob > Date.today
  #       errors.add(:dob, "Birthdate can't be in future!")
  #     end
  # end

  # def end_after_start
  #   return if end_date.blank? || start_date.blank?
  #   if end_date < start_date
  #     errors.add(:end_date, "must be after the start date") 
  #   end 
  # end
end
