class MaterialType < ApplicationRecord
	has_many :waste_infos

	CATEGORIES = [['Landfill', 'landfill'], ['Recycling', 'recycling'], ['Compost', 'compost'], ['Reuse', 'Reuse'], ['Food Recovery', 'food recovery']]

	validates_presence_of :name, :category
	validates_inclusion_of :category, :in => ["landfill", "recycling", "compost", "reuse", "food recovery"], message: "is not a valid category"

	scope :alphabetical, -> { order('name') }
  	scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
end
