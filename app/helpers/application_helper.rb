module ApplicationHelper

	# Returns the full title on a per-page basis
	def full_title(page_title)
		base_title = "My Story"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end 
	end 

	def javascript(*files)
	  content_for(:head_javascript) { javascript_include_tag(*files) }
	end
	def stylesheet(*files)
		content_for(:head_stylesheet) { stylesheet_link_tag(*files) }
	end
end
