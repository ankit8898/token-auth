require 'rails_helper'

RSpec.describe Professor, type: :model do

  let!(:professor) {FactoryGirl.create(:professor)}

  it "should have a type as Professor" do
    expect(professor.type).to eq("Professor")
  end
end
