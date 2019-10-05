FactoryBot.define do

  factory :user do
    id { 1 }
    email { "email@user.com" }
    password {"qwerty"}
    first_name {"Nickola"}
    last_name {"Alab"}
  end

  factory :task do
    title {"Title for task"}
    description {"Description for titile"}
    priority {1}
    due_date {"2019-10-22"}
    completed {false}
    user_id {1}
  end

end
