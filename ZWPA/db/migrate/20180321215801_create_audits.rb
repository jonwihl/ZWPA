class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.string :name
      t.string :audit_type
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
