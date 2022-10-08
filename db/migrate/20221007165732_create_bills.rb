class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :reference, null: false
      t.float :amount, null: false
      t.boolean :approved

      t.timestamps
    end
  end
end
