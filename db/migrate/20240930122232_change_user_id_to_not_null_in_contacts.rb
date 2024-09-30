class ChangeUserIdToNotNullInContacts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :contacts, :user_id, false
  end
end
