import requests
import environment

def get_api_response(endpoint):
    url = environment.BASE_URL + endpoint
    response = requests.get(url)
    return response
