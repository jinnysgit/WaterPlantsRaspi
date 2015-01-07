import urllib
import subprocess
import time

serial_number = '2015AAS'
url = 'http://203.247.166.59/home/update'


print '-------------------------------'
print 'Rafflesia v1.0    by Lab. Lisia'
print '-------------------------------'

while 1:
  temperature = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "0"], stdout=subprocess.PIPE).communicate()[0]
  humidity = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "1"], stdout=subprocess.PIPE).communicate()[0]
  moisture = subprocess.Popen(["sudo", "/home/pi/client/rpiADC", "2"], stdout=subprocess.PIPE).communicate()[0]

  print 'temperature : ' + temperature
  print 'humidity : ' + humidity
  print 'moisture : ' + moisture

  params = urllib.urlencode({
    'serial_number': serial_number,
    'temperature': temperature,
    'humidity': humidity,
    'moisture': moisture
  })

  data = urllib.urlopen(url, params).read()
  print 'Send OK'
  print '-------------------------------'
  time.sleep(60)
