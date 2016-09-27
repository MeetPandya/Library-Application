class AddAllowMultipleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :allowMultiple, :integer
  end
end
