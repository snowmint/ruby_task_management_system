FactoryBot.define do
    factory :test_user, class: User do
      username {"test_user"}
      email {"test_user@mail.com"}
      password {"Password1234"}
      password_confirmation {"Password1234"}
    end
    factory :existed_user, class: User do
      username { "existed_user" }
      email { "existed_user@email.com" }
      password { "Password5678" }
      password_confirmation { "Password5678" }
    end
  end