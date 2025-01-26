from pyowm import OWM
API_key='db8d3281f430d70da331242601ee61a9'

owm=OWM(API_key)
owm.get_API_key()
obs = owm.weather_at_place('87801');
w = obs.get_weather()
print("Clouds: ",w.get_clouds());
print("Sunrise: ",w.get_sunrise_time());
print("Sunrise: ",w.get_sunrise_time(timeformat='iso'));
temp=w.get_temperature('celsius');
print("Temp(C): ",temp['temp'],temp['temp_max'],temp['temp_min']);
wind=w.get_wind();
print("Wind: ",wind['speed'],wind['deg']);
#print(w);

# Clouds:  40
# Sunrise:  1590839871
# Sunrise: 2020-05-30 11:57:51+00
# Temp(C): {'temp': 26.47, 'temp_max': 29.0, 'temp_min': 22.78, 'temp_kf': None}
# Wind: {'speed': 4.1, 'deg': 190}
