class AddNumbers < BaseInteractor

	requires :first_number, :second_number

	def call
		context.sum = first_number + second_number
	end
end