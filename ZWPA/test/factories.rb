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
end