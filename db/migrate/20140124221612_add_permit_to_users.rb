class AddPermitToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :permit, :string, :default => "pay"
  end
end
