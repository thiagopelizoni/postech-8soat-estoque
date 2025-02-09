FactoryBot.define do
  factory :categoria do
    nome { Faker::Commerce.department }
    slug { nome.to_s.parameterize }
  end
end