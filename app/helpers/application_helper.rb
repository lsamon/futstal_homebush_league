module ApplicationHelper
	def flash_class(level)
		klass =
			case level
			when "notice" then "alert alert-info"
			when "success" then "alert alert-success"
			when "error" then "alert alert-danger"
			when "alert" then "alert alert-danger"
			end

		"#{klass} text-center"
	end
end
