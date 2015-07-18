class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  
  def up
    create_table :admin_users_pages, :id => false do |t|
    	# This is a case of simple join, we don't need a 
    	# primary key in this case, hence we can supress
    	# that key in the beginning of the block
    	t.integer :admin_user_id
    	t.integer :page_id
    end
    add_index :admin_users_pages, ["admin_user_id", "page_id"]
  end

  def down
  	drop_table :admin_users_pages
  end
end
