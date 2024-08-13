# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Article title' }
    text { 'Article text' }

    # create a factory with the name article_with_comments
    # to create an article with multiple comments
    factory :article_with_comments do
      # after creating article
      after :create do |article, _evaluetor|
        #  create a list of three comments
        create_list :comment, 3, article:
      end
    end
  end
end
