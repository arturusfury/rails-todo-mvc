class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
