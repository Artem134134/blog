class RemoveEmailFromContact < ActiveRecord::Migration[7.2]
  def change
    remove_column :contacts, :email, :string
  end
end
