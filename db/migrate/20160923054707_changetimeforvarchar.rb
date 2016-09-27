class Changetimeforvarchar < ActiveRecord::Migration[5.0]
  change_column(:bookinghistories, :timefrom, :string)
  change_column(:bookinghistories, :timeto, :string)
end
