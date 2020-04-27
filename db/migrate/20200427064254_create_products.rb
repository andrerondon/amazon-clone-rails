class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
