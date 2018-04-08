class Questionnaire < ActiveRecord::Base
	has_many :audits

	OPTIONS = [['Yes','yes'], ['No', 'no'], ['DK', 'dk']]
	OPTION_KEYS = ['yes', 'no', 'dk']
	WASTE_DISPOSAL_OPTIONS = [["Centralized", "centralized"], ["Tenant", "tenant"]]
	SOLID_WASTE_SYSTEM_OPTIONS = [["Owner", "owner"], ["Management Co", "management co"], ["Tenants", "tenants"]]
	
	# Solid waste containers have an "other" option so we did not vavlidate the inclusion of these options
	SOLID_WASTE_CONTAINER_OPTIONS = [["Dumpster", "dumpster"], ["Roll-Off", "roll-off"], ["Toter", "toter"]]
	
	RECYCLING_PROGRAM_STREAM_OPTIONS = [["Single-Stream", "single"], ["Dual-Stream", "dual"]]

	# validates_presence_of :management_structure, :location_info, :trash_hauler, :solid_waste_storage, :solid_waste_containers, :solid_waste_info, :recycling_program_info, :buy_recycling_policy_info, :discontinued_recycling_info, :compost_program_info

	validates :square_footage, numericality: { only_integer: false, greater_than: 0 }, allow_blank: true
	validates :max_occupancy, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
	validates :num_floors, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
	validates :waste_disposal_system, inclusion: ["centralized", "tenant"], allow_blank: true
	validates :solid_waste_system, inclusion: ["owner", "management co", "tenants"], allow_blank: true
	validates :waste_management_costs, inclusion: OPTION_KEYS, allow_blank: true
	validates :loading_dock, inclusion: OPTION_KEYS, allow_blank: true
	validates :freight_elevators, inclusion: OPTION_KEYS, allow_blank: true
	validates :trash_hauler_contract, inclusion: OPTION_KEYS, allow_blank: true
	validates :trash_hauler_copy, inclusion: OPTION_KEYS, allow_blank: true
	validates :record_of_waste_vol, inclusion: OPTION_KEYS, allow_blank: true
	validates :recycling_mandated, inclusion: OPTION_KEYS, allow_blank: true
	validates :recycling_program, inclusion: OPTION_KEYS, allow_blank: true
	validates :recycling_program_stream, inclusion: ["single", "dual"], allow_blank: true
	validates :buy_recycling_policy, inclusion: OPTION_KEYS, allow_blank: true
	validates :compost_waste_current, inclusion: OPTION_KEYS, allow_blank: true
	validates :compost_waste_past, inclusion: OPTION_KEYS, allow_blank: true
	validates :toner, inclusion: OPTION_KEYS, allow_blank: true
	validates :cfls, inclusion: OPTION_KEYS, allow_blank: true
	validates :batteries, inclusion: OPTION_KEYS, allow_blank: true
	validates :peripherals, inclusion: OPTION_KEYS, allow_blank: true
	validates :cell_phones, inclusion: OPTION_KEYS, allow_blank: true
	validates :tvs, inclusion: OPTION_KEYS, allow_blank: true
	validates :corded_equipment, inclusion: OPTION_KEYS, allow_blank: true
	validates :furniture, inclusion: OPTION_KEYS, allow_blank: true
	validates :linens, inclusion: OPTION_KEYS, allow_blank: true
	validates :construction_debris, inclusion: OPTION_KEYS, allow_blank: true
	validates :pallets, inclusion: OPTION_KEYS, allow_blank: true
	validates :zero_waste_policy, inclusion: OPTION_KEYS, allow_blank: true
	validates :leed_certified, inclusion: OPTION_KEYS, allow_blank: true
	validates :recertify_leed, inclusion: OPTION_KEYS, allow_blank: true
	validates :true_zero_waste_audit, inclusion: OPTION_KEYS, allow_blank: true
	validates :prc_waste_audit, inclusion: OPTION_KEYS, allow_blank: true
end
