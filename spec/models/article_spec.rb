# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe 'validations' do
    it { should validate_presence_of :text }
    it { should validate_presence_of :title }
  end

  describe 'validations_length' do
    it { should validate_length_of :text }
    it { should validate_length_of :title }
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  describe '#subject' do
    it 'returns the article title' do
      # creating an article object in a tricky way!
      article = create(:article, title: 'Bla bla')

      # assert
      expect(article.subject).to eq 'Bla bla'
    end
  end

  describe '#last_comment' do
    it 'returns the last comment' do
      # creating an article but now with comments
      article = create(:article_with_comments)

      # verification
      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end
end
