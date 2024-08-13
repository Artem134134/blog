# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  it { should belong_to :article }
end

describe 'validations_length' do
  it { should validate_length_of :body }
end
