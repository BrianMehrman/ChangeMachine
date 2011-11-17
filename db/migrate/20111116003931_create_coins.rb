class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.integer :value
      t.string :name

      t.timestamps
    end
  end
end
