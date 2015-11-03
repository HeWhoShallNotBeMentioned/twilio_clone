FactoryGirl.define do
  factory :text_message do
    to '+19087701257'
    from '+18482316564'
    body 'This is a test.'
  end
  factory :phone_book do
  end
  factory :phone_number do
    number '+19087701257'
    phone_book_id 'This is a test.'
  end
  factory :user do
    email 'test@test.com'
    password 'password'
  end
end
