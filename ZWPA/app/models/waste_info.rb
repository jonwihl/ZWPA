class WasteInfo < ApplicationRecord
  	belongs_to :area
  	belongs_to :material_type

  	CATEGORIES = [['Landfill', 'landfill'], ['Recycling', 'recycling'], ['Compost', 'compost'], ['Reuse', 'reuse'], ['Food Recovery', 'food recovery']]

  	validates_presence_of :category, :weight, :timestamp
  	validates_inclusion_of :category, :in => ["landfill", "recycling", "compost", "reuse", "food recovery"], message: "is not a valid category"
  	validates_numericality_of :weight, only_integer: false, greater_than: 0
  	
	scope :reverse_chronological, -> { order('timestamp DESC') }
  	scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :anomalies, -> { where(anomaly: true) }
    scope :waste_category,->(category) { where('category == ?', category) }
	scope :waste_contamination, -> { where('category != true_category') }
	scope :area_waste, ->(area_id) { where('area_id == ?', area_id) }
end
