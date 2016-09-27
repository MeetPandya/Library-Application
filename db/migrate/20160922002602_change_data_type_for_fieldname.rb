class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_column(:bookings, :timefrom, :string)
    change_column(:bookings, :timeto, :string)
  end
end
