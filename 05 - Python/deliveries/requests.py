import requests
import webbrowser
r = requests.get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
r=r.json()
webbrowser.open_new_tab(r['url'])