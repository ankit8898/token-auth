FactoryGirl.define do
  factory :user do
    uid {"a@a.com"}
    email {"a@a.com"}
    provider {"email"}
    password {"P@ssw0rd"}
    password_confirmation {"P@ssw0rd"}
    confirmed_at {Time.now}
  end

  factory :student, parent: :user do
    type "Student"
  end

  factory :professor, parent: :user do
    type "Professor"
  end
end
