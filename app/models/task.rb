class Task < ApplicationRecord
    belongs_to :student
    # before_validation :set_title
    validates :title, :student_id, presence: true, length: {maximum: 50}
    after_destroy :log_destroy_action
    
    # this will set title after valid? will run
    after_validation :set_title

    before_save :change_title, if: :title.nil?
    
    after_save do
        puts "Record Saved!"
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
