class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.references :user, foreign_key: true
      t.references :categories, foreign_key: true
      t.string :description
      t.date :action_date
      t.decimal :amount, precision: 12, scale: 2

      t.timestamps
    end
  end
end
