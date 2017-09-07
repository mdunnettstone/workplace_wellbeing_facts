class AddYearToStats < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :year, :integer
  end
end
