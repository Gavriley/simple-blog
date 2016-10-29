module ApplicationHelper
	def get_title
		return " | #{@title}" unless @title.nil?
	end	
end
