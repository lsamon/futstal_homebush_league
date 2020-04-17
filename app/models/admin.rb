# frozen_string_literal

class Admin < User
	default_scope { admin }
end