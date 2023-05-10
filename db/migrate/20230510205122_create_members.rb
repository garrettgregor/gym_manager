class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :money_spent
      t.boolean :co_resident
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
