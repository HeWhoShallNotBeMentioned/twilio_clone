FactoryGirl.define do
  factory :text_message do
    to '+19087701257'
    from '+18482316564'
    body 'This is a test.'
  end
end
