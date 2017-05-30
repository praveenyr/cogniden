class CreateWikisCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table(:collaborators) do |t|
      t.references :user
      t.references :wiki
      t.timestamps
    end
  end
end