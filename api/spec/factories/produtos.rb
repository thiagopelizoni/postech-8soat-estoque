FactoryBot.define do
    factory :produto do
      sequence(:nome) { |n| "Produto #{Faker::Commerce.product_name} #{n}" }
    
      preco { Faker::Commerce.price(range: 1.0..1000.0) }


      categoria
    end
  end