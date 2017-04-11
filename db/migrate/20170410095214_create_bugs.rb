class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :title, index: { unique: true}
      t.integer :deadline
      t.string :bug_type
      t.string :status
      t.string :name
      t.string :attachment
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.integer :developer_id
      t.timestamps
    end
  end
end
