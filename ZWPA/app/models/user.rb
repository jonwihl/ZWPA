class User < ActiveRecord::Base
    has_secure_password

  	has_many :audits

    ROLES = [['Administrator','administrator']]

  	validates_presence_of :first_name, :last_name, :email, :role
  	validates_uniqueness_of :email
  	# Currently there is only one role; more roles can be added if needed
  	validates_inclusion_of :role, :in => ["administrator"], message: "is not a valid role"
  	validates_presence_of :password, :on => :create
  	validates_presence_of :password_confirmation, :on => :create
  	validates_confirmation_of :password, message: "does not match"
  	validates_length_of :password, :minimum => 8, message: "It must be at least 8 characters long", :allow_blank => true

  	# email format
  	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov))\z/i, message: "is not a valid format"

  	scope :alphabetical, -> { order('last_name, first_name') }
  	scope :active, -> { where(active: true) }
  	scope :role, ->(role) { where('role == ?', role) }

  	# Returns the user's name in the following format: first_name last_name
    def proper_name
      first_name + " " + last_name
    end

end
