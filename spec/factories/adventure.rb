# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :adventure, :class => 'Adventure' do
    title "Mind Blowingly Fun Cave Excursion"
    price 499.99
    state "Oregon"
    category "splunking"
  end
end
