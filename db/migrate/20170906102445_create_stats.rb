class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.string :fact
      t.string :category
      t.integer :sample
      t.string :source
      t.string :instruction
      t.string :link
      t.timestamps
    end
  end
end
