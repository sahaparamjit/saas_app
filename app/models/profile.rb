class Profile < ActiveRecord::Base
    belongs_to :user
    validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
    
    ## Association of paperclip for image upload on to the server.
    has_attached_file :avatar,
                      :styles => {:medium => "300x300", :thumb => "100x100"},
                      :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    
end