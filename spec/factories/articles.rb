FactoryBot.define do
  factory :article do
    date { "2022-01-03 17:44:42" }
    shop_name { "MyString" }
    bean_name { "MyString" }
    producing_area { "MyString" }
    particle_size { 1.5 }
    memo { "MyText" }
    photos { nil }
    want_to_again { false }
  end
end
