class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true # :user_id
      t.datetime :scheduled_at

      t.timestamps null: false
    end
  end
end
