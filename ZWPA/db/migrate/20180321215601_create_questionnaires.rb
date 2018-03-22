class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.float :square_footage
      t.integer :max_occupancy
      t.integer :num_floors
      t.text :management_structure
      t.string :waste_disposal_system
      t.string :solid_waste_system
      t.string :waste_management_costs
      t.string :loading_dock
      t.string :freight_elevators
      t.text :location_info
      t.string :trash_hauler
      t.string :trash_hauler_contract
      t.string :trash_hauler_copy
      t.string :record_of_waste_vol
      t.string :solid_waste_storage
      t.string :solid_waste_containers
      t.text :solid_waste_info
      t.string :recycling_mandated
      t.string :recycling_program
      t.string :recycling_program_stream
      t.text :recycling_program_info
      t.string :buy_recycling_policy
      t.text :buy_recycling_policy_info
      t.text :discontinued_recycling_info
      t.string :compost_waste_current
      t.string :compost_waste_past
      t.text :compost_program_info
      t.string :toner
      t.string :cfls
      t.string :batteries
      t.string :peripherals
      t.string :cell_phones
      t.string :tvs
      t.string :corded_equipment
      t.string :furniture
      t.string :linens
      t.string :construction_debris
      t.string :pallets
      t.string :zero_waste_policy
      t.string :leed_certified
      t.string :recertify_leed
      t.string :true_zero_waste_audit
      t.string :prc_waste_audit

      t.timestamps
    end
  end
end
