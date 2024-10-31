class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.references :trackable, polymorphic: true, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
