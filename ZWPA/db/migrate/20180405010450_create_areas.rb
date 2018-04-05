class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.boolean :active
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.references :audit, foreign_key: true

      t.timestamps
    end
  end
end
