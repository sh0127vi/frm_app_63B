FactoryBot.define do

  factory :product do
    association :user
    association :category
    
    
    name            {"a"}
    detail          {"a"}
    price           {"301"}
    condition       {"a"}
    city            {"a"}
    delivery        {"1"}
    fee_payer       {"1"}
    delivery_area   {"a"}
    
  end
end