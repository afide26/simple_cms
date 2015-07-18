class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      # the line below is the foreign key to link pages to subject
      t.integer :subject_id
      # same as t.reference :subject
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, :default => false
      t.timestamps null: false
    end

    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  end
end
