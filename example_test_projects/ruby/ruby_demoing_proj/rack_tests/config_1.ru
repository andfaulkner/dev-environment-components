# run can be called on anything that responds to a .call
run lambda { |env|
	[
		200,
		{"Content-Type" => "text/plain"},
		["Hello. The time is #{Time.now}"]
	]
}
