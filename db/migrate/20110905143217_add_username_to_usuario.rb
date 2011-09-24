class AddUsernameToUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :username, :string
  end

  def self.down
    remove_column :usuarios, :username
  end
end
