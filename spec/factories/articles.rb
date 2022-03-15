FactoryBot.define do
  factory :article do
    date { "2022-01-01 00:00:00" }
    shop_name { "my shop" }
    bean_name { "my bean" }
    producing_area { "my producing area" }
    particle_size { 1.5 }
    memo { "my memo" }
    photos { nil }
    want_to_again { false }
  end
end
