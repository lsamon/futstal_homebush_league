FactoryBot.define do
	factory :season do
		name { "Winter #{Time.current.year}" }
		start_date { Time.current - 1.month }
		end_date { Time.current + 2.months }
	end
end