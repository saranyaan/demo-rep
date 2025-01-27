from flask import Flask
import requests
from bs4 import BeautifulSoup

app = Flask(_name_)

@app.route('/')
def scrape_website():
    url = "http://example.com"  # Replace with any URL you want to scrape
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    title = soup.title.string  # Get the title of the webpage
    return f"Web Scraped Title: {title}"

if _name_ == "_main_":
    app.run(host='0.0.0.0', port=8080)