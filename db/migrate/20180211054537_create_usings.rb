class CreateUsings < ActiveRecord::Migration[5.1]
  def change
    create_table :usings do |t|
      t.references :user, foreign_key: true
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
