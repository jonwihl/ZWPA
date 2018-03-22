FactoryBot.define do
	factory :user do
	    first_name "MyString"
	    last_name "MyString"
	    email "example@prc.org"
	    role "administrator"
	    password "secrets1"
	    password_confirmation "secrets1"
	    active true
	end

	factory :client do
		name "CMU"
		street_1 "5000 Forbes Ave"
		city "Pittsburgh"
		state "PA"
		zip "15213"
		contact_phone "1234567890"
		contact_email "example@andrew.cmu.edu"
		contact_first_name "John"
		contact_last_name "Doe"
		active true
	end

	factory :audit do
		name "CMU IS Department"
		audit_type "Building"
		start_date "2018-02-18 22:35:42"
		end_date nil
		active true
		user nil
		client nil
		questionnaire nil
	end
end