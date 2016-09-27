class AddHasBookedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hasBooked, :string
  end
end
