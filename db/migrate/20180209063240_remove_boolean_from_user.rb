class RemoveBooleanFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :boolean, :boolean
  end
end
