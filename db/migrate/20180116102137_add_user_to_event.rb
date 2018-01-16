class AddUserToEvent < ActiveRecord::Migration[5.1]

  def change
    change_column :events, :includes_drinks, :boolean, default: false
  end

  def change
    add_reference :events, :user, foreign_key: true
  end
end
