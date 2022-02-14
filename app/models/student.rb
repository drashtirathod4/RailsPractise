class Student < ApplicationRecord
    validates :login, :email, presence: true, on: :create
    has_many :tasks, before_add: :bef_task, after_add: :aft_task

    before_validation :ensure_login_has_a_value
    before_validation :normalize_name, on: :create, if: :name?
    before_validation :remove_whitespaces, if: :name?
    after_validation :print_status
    
    private
    def bef_task
        puts "Before adding"
    end

    def aft_task
        puts "After adding"
    end

    private
    def ensure_login_has_a_value
        if login.nil?
            self.login = name unless email.blank?
        end
    end

    private
    def normalize_name
        self.name  = name.downcase.titleize
    end

    private
    def remove_whitespaces
        name.strip!
    end

    private
    def print_status
        puts "Validated"
    end

    after_save do
        puts "New Record Saved!"
    end

    before_create do
        self.name = login.capitalize if name.blank?
    end

    after_create do
        puts "Record Created!"
    end
    
    before_update do
        self.login = name if login.blank?
    end

    after_update do
        puts "Student Updated!"
    end

    after_initialize do |student|
        puts "Object Initialized"
    end

    after_find do |student|
        puts "object found..."
    end

    after_touch do |student|
        puts "You have touched an object"
    end
end
