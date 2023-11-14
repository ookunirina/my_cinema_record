FactoryBot.define do
  factory :movierecord do
    association :user
    title { Faker::Movie.title }
    image_url { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/default.png'), 'image/png') }
    viewing_style { ["映画館", "動画配信サイト", "DVDorBlu-ray"].sample }
    star { rand(1..5) }
    review { Faker::Lorem.paragraph(sentence_count: 5) }
  end
end