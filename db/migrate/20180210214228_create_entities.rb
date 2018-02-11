class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :docNumber
      t.text :address
      t.text :postaCode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
