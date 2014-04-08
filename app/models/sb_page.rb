class SbPage < ActiveRecord::Base
	belongs_to :scrapbook
	serialize :scribbles,Array
	def initialize(params=nil)
		attr_with_defaults = {:pagedate => Time.new }.merge(params || {})
		super(attr_with_defaults)
	end

	def addScribble(scribble)
		:scribbles.push(scribble)
	end
end
