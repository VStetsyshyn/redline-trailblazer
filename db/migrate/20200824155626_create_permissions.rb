class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :action
      t.integer :resource_class
      t.integer :resource_id
      t.belongs_to :user
      t.timestamps
    end
  end
end
