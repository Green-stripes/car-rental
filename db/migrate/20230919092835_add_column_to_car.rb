class AddColumnToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :photo, :text
  end
end
