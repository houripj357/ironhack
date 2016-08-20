class CreateSandwichIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :sandwich_ingredients do |t|
      t.integer :ingredient_id
      t.integer :sandwich_id

      t.timestamps
    end
  end
end
