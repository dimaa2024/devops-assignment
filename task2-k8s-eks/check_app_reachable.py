import requests

url = "http://<load_balancer_public_ip>"
try:
    response = requests.get(url)
    if response.status_code == 200:
        print("Application is reachable.")
    else:
        print(f"Application returned status code {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"Failed to reach the application: {e}")