class Audit < ActiveRecord::Base
	belongs_to :user
	belongs_to :client
	belongs_to :questionnaire

	validates_presence_of :name, :audit_type, :start_date

	validates_date :start_date, on_or_before: lambda { Date.current }
	validates_date :end_date, on_or_after: lambda { Date.current }, allow_nil:true
	validates_inclusion_of :audit_type, :in => ["Building", "Event"], message: "is not a valid audit type"

	scope :alphabetical, -> { order('name') }
	scope :active, -> { where(active: true) }
	scope :chronological, -> { order('start_date') }
	scope :in_progress, -> { where(end_date: nil) }
	scope :user_audits, ->(user_id) { where('user_id == ?', user_id) }
	scope :client_audits, ->(client_id) {  where('client_id == ?', client_id) }
  	scope :type, ->(type) { where('audit_type == ?', type) }

  	def status
      	if end_date.nil?
      		"In progress"
      	else
      		"Finished"
      	end
    end
end
