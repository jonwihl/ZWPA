class Questionnaire < ActiveRecord::Base
	has_many :audits

	OPTIONS = [['Yes','yes'], ['No', 'no'], ['DK', 'dk']]
	OPTION_KEYS = ['yes', 'no', 'dk']
	WASTE_DISPOSAL_OPTIONS = [["Centralized", "centralized"], ["Tenant", "tenant"]]
	SOLID_WASTE_SYSTEM_OPTIONS = [["Owner", "owner"], ["Management Co", "management co"], ["Tenants", "tenants"]]
	
	# Solid waste containers have an "other" option so we did not vavlidate the inclusion of these options
	SOLID_WASTE_CONTAINER_OPTIONS = [["Dumpster", "dumpster"], ["Roll-Off", "roll-off"], ["Toter", "toter"]]
	
	RECYCLING_PROGRAM_STREAM_OPTIONS = [["Single-Stream", "single"], ["Dual-Stream", "dual"]]

	validates_presence_of :management_structure, :location_info, :trash_hauler, :solid_waste_storage, :solid_waste_containers, :solid_waste_info, :recycling_program_info, :buy_recycling_policy_info, :discontinued_recycling_info, :compost_program_info

	validates :square_footage, :presence => true, numericality: { only_integer: false, greater_than: 0 }
	validates :max_occupancy, :presence => true, numericality: { only_integer: true, greater_than: 0 }
	validates :num_floors, :presence => true, numericality: { only_integer: true, greater_than: 0 }
	validates :waste_disposal_system, :presence => true, inclusion: ["centralized", "tenant"]
	validates :solid_waste_system, :presence => true, inclusion: ["owner", "management co", "tenants"]
	validates :waste_management_costs, :presence => true, inclusion: OPTION_KEYS
	validates :loading_dock, :presence => true, inclusion: OPTION_KEYS
	validates :freight_elevators, :presence => true, inclusion: OPTION_KEYS
	validates :trash_hauler_contract, :presence => true, inclusion: OPTION_KEYS
	validates :trash_hauler_copy, :presence => true, inclusion: OPTION_KEYS
	validates :record_of_waste_vol, :presence => true, inclusion: OPTION_KEYS
	validates :recycling_mandated, :presence => true, inclusion: OPTION_KEYS
	validates :recycling_program, :presence => true, inclusion: OPTION_KEYS
	validates :recycling_program_stream, :presence => true, inclusion: ["single", "dual"]
	validates :buy_recycling_policy, :presence => true, inclusion: OPTION_KEYS
	validates :compost_waste_current, :presence => true, inclusion: OPTION_KEYS
	validates :compost_waste_past, :presence => true, inclusion: OPTION_KEYS
	validates :toner, :presence => true, inclusion: OPTION_KEYS
	validates :cfls, :presence => true, inclusion: OPTION_KEYS
	validates :batteries, :presence => true, inclusion: OPTION_KEYS
	validates :peripherals, :presence => true, inclusion: OPTION_KEYS
	validates :cell_phones, :presence => true, inclusion: OPTION_KEYS
	validates :tvs, :presence => true, inclusion: OPTION_KEYS
	validates :corded_equipment, :presence => true, inclusion: OPTION_KEYS
	validates :furniture, :presence => true, inclusion: OPTION_KEYS
	validates :linens, :presence => true, inclusion: OPTION_KEYS
	validates :construction_debris, :presence => true, inclusion: OPTION_KEYS
	validates :pallets, :presence => true, inclusion: OPTION_KEYS
	validates :zero_waste_policy, :presence => true, inclusion: OPTION_KEYS
	validates :leed_certified, :presence => true, inclusion: OPTION_KEYS
	validates :recertify_leed, :presence => true, inclusion: OPTION_KEYS
	validates :true_zero_waste_audit, :presence => true, inclusion: OPTION_KEYS
	validates :prc_waste_audit, :presence => true, inclusion: OPTION_KEYS
end
