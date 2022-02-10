# Follow up the tutorial of the web scrapper https://towardsdatascience.com/how-to-web-scrape-with-python-in-4-minutes-bc49186a8460
import requests
import urllib.request
import time
from bs4 import BeautifulSoup

url = 'http://web.mta.info/developers/turnstile.html'
#Verify the url exists and works
response = requests.get(url)
#print(response)
#Convert html code obtained from the url to common text
soup = BeautifulSoup(response.text, 'html.parser')
#print(soup)
#Move to an object all the lines that contains <a> tag
a=soup.findAll('a')
#print(a)
# Move to an object the line in position #38 
one_a_tag = soup.findAll('a')[38]
#print(one_a_tag)
#Get the value of the hfref aka href='this'
link = one_a_tag['href']
print(link)
#Complete the request
download_url = 'http://web.mta.info/developers/'+ link
#full url
urllib.request.urlretrieve(download_url,'./'+link[link.find('/turnstile_')+1:])
time.sleep(1)
