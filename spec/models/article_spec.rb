require 'rails_helper'

describe Article do
  describe "validations" do 
    it { should validate_presence_of :text}
    it { should validate_presence_of :title}
  end

  describe "associations" do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "returns the article title" do 
      # creating an article object in a tricky way!
      article = create(:article, title: 'Bla bla')

      # assert
      expect(article.subject).to eq 'Bla bla'
    end  
  end
end