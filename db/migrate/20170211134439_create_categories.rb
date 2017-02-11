class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true
      t.references :type, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
