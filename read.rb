require "uri"
require "net/http"
require "net/https"

while true

	begin
		temperature = 0
		File.open("/sys/bus/w1/devices/28-0116284b1dee/w1_slave", "r") do |f|
       		 text = f.read
      		  temperature = text[/\d{5}/].to_f/1000
      	 	 p "The temperature now is: #{temperature}"
		end
		uri = URI.parse('http://thermo-app.herokuapp.com/temperature') 
		response = Net::HTTP.post_form(uri, {"temperature" => temperature})		
		sleep(10)
	
	rescue => e
		p e.message
	end

end



