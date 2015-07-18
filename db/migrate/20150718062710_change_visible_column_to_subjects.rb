class ChangeVisibleColumnToSubjects < ActiveRecord::Migration
  def change
  	change_column("subjects", "visible", :boolean, :default => false)
  end
end
