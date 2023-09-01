FactoryBot.define do
  factory :movie do
    title { 'MyString' }
    overview { 'MyText' }
    poster_path { 'MyString' }
    vote_average { 1.5 }
  end
end
