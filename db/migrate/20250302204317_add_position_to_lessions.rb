class AddPositionToLessions < ActiveRecord::Migration[8.0]
  def change
    add_column :lessions, :position, :integer
  end
end
