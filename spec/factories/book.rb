FactoryBot.define do

  factory :book do
    date {"2020-06-01 15:00:00"}
    price {"1000"}
    category_id {5}
    user #アソシエーションの表記
    category #アソシエーションの表記
  end

end