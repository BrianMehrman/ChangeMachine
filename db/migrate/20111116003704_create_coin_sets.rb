class CreateCoinSets < ActiveRecord::Migration
  def change
    create_table :coin_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
