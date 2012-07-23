class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.integer :display_order
      t.timestamps
    end
  end
end
