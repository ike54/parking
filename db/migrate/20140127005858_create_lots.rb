class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.string :lotid
      t.string :permit

      t.timestamps
    end
    add_index :lots, :lotid
  end
end
