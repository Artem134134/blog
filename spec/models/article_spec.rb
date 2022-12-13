require 'rails_helper'

describe Article do
  describe "validations" do 
    it { should validate_presence_of :text}
    it { should validate_presence_of :title}
  end

  describe "associations" do
    it { should have_many :comments }
  end
end