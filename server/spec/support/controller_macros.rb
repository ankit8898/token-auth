module ControllerMacros
  def login_professor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:professor]
      #user = FactoryGirl.create(:student)
      user = 'p'
      user = Professor.create!(email: "#{user}@a.com",
                               password: 'P@ssw0rd',
                               uid: "#{user}@a.com",
                               provider: 'email',
                               confirmed_at: Time.now)
      sign_in user
    end
  end

  def login_student
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      user = 's'
      #Factory girl is having some reloading issues, creating directly
      #user = FactoryGirl.create(:student)
      user = Student.create!(email: "#{user}@a.com",
                             password: 'P@ssw0rd',
                             uid: "#{user}@a.com",
                             provider: 'email',
                             confirmed_at: Time.now)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end
