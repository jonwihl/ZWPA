# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{active: true, email: "al@prc.com", first_name: "alan", last_name: "bar", password: "secrets1", password_confirmation: "secrets1", role: "administrator"}]);
User.create([{active: true, email: "bob@prc.com", first_name: "rob", last_name: "bob", password: "secrets1", password_confirmation: "secrets1", role: "administrator"}]);
User.create([{active: true, email: "intern@prc.com", first_name: "katie", last_name: "stark", password: "secrets1", password_confirmation: "secrets1", role: "administrator"}]);

Client.create([{ name: "pnc", street_1: "123", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "1231231234", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "marge", contact_last_name: "robert", active: true }]);
Client.create([{ name: "phipps", street_1: "1234", street_2: "234", city: "Pittsburgh", state: "PA", zip: "11111", contact_phone: "1231231234", contact_email: "pnc@pnc.com", contact_title: "manager", contact_first_name: "mary", contact_last_name: "gold", active: true }]);
