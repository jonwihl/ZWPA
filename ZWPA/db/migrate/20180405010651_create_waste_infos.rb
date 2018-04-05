class CreateWasteInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :waste_infos do |t|
      t.string :category
      t.string :true_category
      t.float :weight
      t.text :notes
      t.boolean :anomaly
      t.datetime :timestamp
      t.boolean :active
      t.references :area, foreign_key: true
      t.references :material_type, foreign_key: true

      t.timestamps
    end
  end
end
