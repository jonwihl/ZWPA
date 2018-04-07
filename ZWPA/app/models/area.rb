class Area < ApplicationRecord
  	belongs_to :audit
    has_many :waste_infos

  	validates_presence_of :name, :start_date
  	validates_inclusion_of :status, :in => ["in progress", "complete"]

  	scope :alphabetical, -> { order('name') }
  	scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :in_progress, -> { where(status: "in progress") }
    scope :complete, -> { where(status: "complete") }
end
