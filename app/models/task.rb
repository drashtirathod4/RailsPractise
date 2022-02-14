class Task < ApplicationRecord
    belongs_to :student, counter_cache: true
    # before_validation :set_title
    validates :title, presence: true, length: {maximum: 50}
    validates :student_id, presence: true
    after_destroy :log_destroy_action
    
    # this will set title after valid? will run
    after_validation :set_title, unless: :title

    before_save :change_title, unless: :title
    before_save :normalize_title, if: :title?
    after_save :saved

    def saved
        puts "The task is now saved!"
    end
    
    private
    def normalize_title
        self.title  = title.downcase.titleize
    end

    after_save do
        puts "Record Saved!"
    end

    around_save do
        puts "Around Save!"
    end

    private
    def set_title
        self.title = "Complete today's tasks"
    end

    def change_title
        self.title = "Complete today's and remaining tasks"
    end

    def log_destroy_action
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

    after_update do
        puts "Task Updated"
    end
end
