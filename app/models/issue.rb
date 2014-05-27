class Issue < ActiveRecord::Base
	validates_presence_of :title
	validates_uniqueness_of :title, message: "Title should be unique!"

	validates_length_of :description, minimum: 10
	validates_numericality_of :no_followers

	#validates_with Yesnovalidator

	belongs_to :project

	after_save :add_to_timeline

	private
	def add_to_timeline
		Timeline.create!({content: "An issues was created", timelineable_id: id, timelineable_type: self.class.to_s})
	end

end
