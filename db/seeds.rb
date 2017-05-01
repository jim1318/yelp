# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "jim@gmail.com", password: "jimjim", full_name: "Jim Finnigan")
User.create(email: "bernie@gmail.com", password: "berniebernie", full_name: "Bernie Finnigan")

5.times do |index|
  Business.create( Fabricate.attributes_for(:business))
end

5.times do |index|
  Review.create( Fabricate.attributes_for(:review, user_id: 1, business_id: index + 1 ))
end