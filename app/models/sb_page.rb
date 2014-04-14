class SbPage < ActiveRecord::Base
	belongs_to :scrapbook
	serialize :scribbles,Array
	has_many :scribbles
	def initialize(params=nil)
		attr_with_defaults = {:pagedate => Time.new }.merge(params || {})
		super(attr_with_defaults)
	end

	
end
