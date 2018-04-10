# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({active: true, email: "admin@prc.com", first_name: "admin", last_name: "admin", password: "secrets1", password_confirmation: "secrets1", role: "administrator"});

MaterialType.create({name: "Cardboard", category: "landfill", active: true})
MaterialType.create({name: "Composite Food Service Ware", category: "landfill", active: true})
MaterialType.create({name: "Dairy and Juice containers", category: "landfill", active: true})
MaterialType.create({name: "Final Disposal", category: "landfill", active: true})
MaterialType.create({name: "Food Scraps", category: "landfill", active: true})
MaterialType.create({name: "Metal Cans, Glass Bottles, and Jars", category: "landfill", active: true})
MaterialType.create({name: "Mixed Paper, Newspaper & Magazines", category: "landfill", active: true})
MaterialType.create({name: "K-Cups", category: "landfill", active: true})
MaterialType.create({name: "Paper Towels", category: "landfill", active: true})
MaterialType.create({name: "Plastic (1-2 & 5) ", category: "landfill", active: true})
MaterialType.create({name: "White Ledger Paper", category: "landfill", active: true})
MaterialType.create({name: "Mixed Paper, Newspaper & Magazines", category: "landfill", active: true})
MaterialType.create({name: "Coffee Cups", category: "landfill", active: true})
MaterialType.create({name: "Polystyrene Food Service Ware (Foam)", category: "landfill", active: true})
MaterialType.create({name: "Polystyrene Plastics", category: "landfill", active: true})
MaterialType.create({name: "White Ledger Paper", category: "landfill", active: true})
MaterialType.create({name: "Biodegradable Service Ware", category: "landfill", active: true})
MaterialType.create({name: "Miscelaneous", category: "landfill", active: true})
MaterialType.create({name: "Wet Waste", category: "landfill", active: true})
MaterialType.create({name: "Flourescent Tubes", category: "landfill", active: true})
MaterialType.create({name: "Contamination", category: "landfill", active: true})
MaterialType.create({name: "Batteries ", category: "landfill", active: true})
