class CreateGyms < ActiveRecord::Migration[7.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.integer :member_cost
      t.integer :guest_cost
      t.boolean :in_colorado

      t.timestamps
    end
  end
end
