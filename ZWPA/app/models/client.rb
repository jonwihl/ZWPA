class Client < ActiveRecord::Base
	before_save :reformat_phone

	has_many :audits

	validates_presence_of :name, :street_1, :city, :state, :zip, :contact_phone, :contact_email, :contact_first_name, :contact_last_name

	# if zip included, it must be 5 digits only
  	validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"

	# email format
  	validates_format_of :contact_email, with: /\A([\w^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|us))\z/i, message: "is not a valid format"

    # phone can have dashes, spaces, dots and parens, but must be 10 digits
  	validates_format_of :contact_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"

  	scope :alphabetical, -> { order('name') }
  	scope :active, -> { where(active: true) }

  	# Returns the contact's name in the following format: first_name last_name
    def proper_name
      contact_first_name + " " + contact_last_name
    end

  	private
	    # Callback code that strips non-digits before saving the phone number to the database
	    def reformat_phone
	    	phone = self.contact_phone.to_s  # change to string in case input as all numbers 
	        phone.gsub!(/[^0-9]/,"") 		 # strip all non-digits
	        self.contact_phone = phone 		 # reset self.phone to new string
	    end  
end
