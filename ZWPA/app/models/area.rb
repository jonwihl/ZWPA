class Area < ApplicationRecord
  	belongs_to :audit

  	validates_presence_of :name

  	scope :alphabetical, -> { order('name') }
  	scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
end
