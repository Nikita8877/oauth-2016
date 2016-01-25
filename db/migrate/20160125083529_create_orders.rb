class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
