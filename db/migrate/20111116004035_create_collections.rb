class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :coin_id
      t.integer :coin_set_id

      t.timestamps
    end
  end
end
