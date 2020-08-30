class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status, default: 0
      t.belongs_to :client
      t.belongs_to :user

      t.timestamps
    end
  end
end
