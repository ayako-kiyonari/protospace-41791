class RenameConceptToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :concept, :content
  end
end
