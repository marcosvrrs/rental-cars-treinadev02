class AddStatusToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :status, :integer
  end
end
