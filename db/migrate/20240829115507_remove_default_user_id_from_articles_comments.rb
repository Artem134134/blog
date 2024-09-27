# frozen_string_literal: true

class RemoveDefaultUserIdFromArticlesComments < ActiveRecord::Migration[7.1]
  def change
    return unless User.any?

    change_column_default :articles, :user_id, from: User.first.id, to: nil
    change_column_default :comments, :user_id, from: User.first.id, to: nil
  end
end
