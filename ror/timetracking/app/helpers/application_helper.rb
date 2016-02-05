module ApplicationHelper
	def flash_message

	end

	private

	def flash_content(type)
		if flash[type]
			content_tag :div, class: "#{type}" do
				content_tag :p do
					flash[type]
				end
			end
		end
	end
end