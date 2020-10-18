FactoryBot.define do
  factory :user, class: User do
    first_name { 'Malorie' }
    last_name {'C'}
    email {'malorie@malorie.com'}
    street_1 {'23 Awesome Way'}
    street_2 {'Apt 2'}
    city {'Brooklyn'}
    state {'NY'}
    zip {'11233'}
    phone {'718-222-3030'}
    cc_num {1234}
    exp {'10/23'}
    uid {"236127321"}
    
    trait :no_email do
        email {''}
    end

    trait :with_transaction do
        after :create do |user|
             create(:transaction, user_id: user.id)
        end
    end
  end
end
