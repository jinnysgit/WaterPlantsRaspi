import urllib
import subprocess
import time

serial_number = '2015AAA'
url = 'http://203.247.166.59/home/update'

while 1:
  temperature = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "0"], stdout=subprocess.PIPE)
  humidity = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "1"], stdout=subprocess.PIPE)
  moisture = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "2"], stdout=subprocess.PIPE)


  params = urllib.urlencode({
    'serial_number': serial_number,
    'temperature': temperature.communicate()[0],
    'humidity': humidity.communicate()[0],
    'moisture': moisture.communicate()[0]
  })

  data = urllib.urlopen(url, params).read()
  time.sleep(60)
