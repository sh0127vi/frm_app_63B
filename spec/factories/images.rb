FactoryBot.define do

  factory :image do
    association :product

    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg')) }
    
  end
end