require 'faker'

FactoryGirl.define do
  factory :speaker do
    name { Faker::Name.name }
    gmail { "#{Faker::Internet.user_name}@gmail.com" }
    fb_link { "https://www.facebook.com/#{Faker::Internet.user_name}" }
    phone { Faker::PhoneNumber.cell_phone }
    location { Faker::Address.country }
    ioh_url { "https://ioh.tw/talks/#{Faker::Internet.user_name}" }
    feedback { Faker::Lorem.paragraph }
    speaker_school '台灣大學'
    speaker_department '社會學系'
  end
end
