class ChangeStringForHasBooked < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :hasBooked, 'integer USING CAST("hasBooked" AS integer)'
  end
end
