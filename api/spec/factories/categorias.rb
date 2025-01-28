FactoryBot.define do
  factory :categoria do
    sequence(:nome) { |n| "Categoria #{Faker::Commerce.department} #{n}" }
  end
end