class RenameIntrotuctionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :introtuction, :introduction
  end
end
