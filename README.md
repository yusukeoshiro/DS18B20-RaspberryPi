# DS18B20-RaspberryPi
Reads the sensor readings and posts the result to heroku app

Make sure your DS18B20 is connected to GPIO port 4 and enabled 1-wire. [ref](https://colo-ri.jp/develop/2016/05/raspberry-pi-ds18b20.html)

For this implementation, the temperature is being posted to a remote server (this could be anything) hosted on heroku.
