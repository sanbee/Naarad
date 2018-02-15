##/usr/local/stow/python-3.5.0/bin/ipython3

from pyowm import OWM
API_key='db8d3281f430d70da331242601ee61a9'

owm=OWM(API_key)
owm.get_API_key()
obs = owm.weather_at_place('Socorro,NM')
w = obs.get_weather()
w.get_clouds()
w.get_sunrise_time()
w.get_sunrise_time(timeformat='iso')
w.get_temperature('celsius')
print(w)
w.get_wind()
w.get_sunrise_time('iso')
