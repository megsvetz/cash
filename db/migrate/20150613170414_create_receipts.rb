class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :name
      t.datetime :date
      t.float :amount
      t.string :description
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
