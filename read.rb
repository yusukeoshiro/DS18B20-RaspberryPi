require "uri"
require "net/http"
require "net/https"
require "dotenv"
Dotenv.load

while true

	begin
		temperature = 0
		File.open("/sys/bus/w1/devices/#{ENV["SENSOR_ID"]}/w1_slave", "r") do |f|
       		 text = f.read
      		  temperature = text[/\d{5}/].to_f/1000
      	 	 p "The temperature now is: #{temperature}"
		end
		uri = URI.parse(ENV["SENSOR_DATA_URL"]) 
		response = Net::HTTP.post_form(uri, {"temperature" => temperature})
	rescue => e
		p e.message

	end

	sleep(60)

end



