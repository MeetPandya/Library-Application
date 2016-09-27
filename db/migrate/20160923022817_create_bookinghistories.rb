class CreateBookinghistories < ActiveRecord::Migration[5.0]
  def change
    create_table :bookinghistories do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :date
      t.datetime :timefrom
      t.datetime :timeto
      t.string :members
      t.timestamps
    end
  end
end
