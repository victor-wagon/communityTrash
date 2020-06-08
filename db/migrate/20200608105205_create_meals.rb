class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :description
      t.integer :rating
      t.integer :capacity

      t.timestamps
    end
  end
end
