class AddGravatarHashToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :gravatar_hash, :string
  end
end
