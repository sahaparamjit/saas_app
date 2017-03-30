class Profile < ActiveRecord::Base
    belongs_to :user
    validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
end