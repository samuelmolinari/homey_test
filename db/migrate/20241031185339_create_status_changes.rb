class CreateStatusChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :status_changes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :from_status, null: true
      t.string :to_status, null: false

      t.timestamps
    end
  end
end
