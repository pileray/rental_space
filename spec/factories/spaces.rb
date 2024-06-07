FactoryBot.define do
  factory :space do
    name { "MyString" }
    despcription { "MyText" }
    address { "MyString" }
    nearest_station { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
