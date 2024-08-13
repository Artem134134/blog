# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    author { 'Moby' }
    sequence(:body) { |n| "comment body #{n}" }
    # body { "something qwewq" }
  end
end
