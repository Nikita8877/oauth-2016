class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid, index: true, null: false
      t.string :provider, index: true, null: false

      t.timestamps null: false
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
