Fabricator(:business) do
  name { Faker::Company.name }
  address { Faker::Address.street_address }
end