require 'rails_helper'

RSpec.describe Student, type: :model do

  let!(:student) {FactoryGirl.create(:student)}

  it "should have a type as student" do
    expect(student.type).to eq("Student")
  end
end
