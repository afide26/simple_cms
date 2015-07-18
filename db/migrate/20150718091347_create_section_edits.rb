class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
    	# At the start of the code block the id was not suppressed
    	# which means that in this RICH join, the primary key is true
    	# In this example, t.references was used for the foreign keys
    	# instead of t.integer :admin_user_id if that style was used for
    	# the first |t| attribute
    	t.references :admin_user
    	t.references :section
    	t.string :summary
      t.timestamps null: false
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down
  	drop_table :section_edits
  end

end
