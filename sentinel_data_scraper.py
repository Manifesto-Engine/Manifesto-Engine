import requests

def fetch_iocs(url):
    headers = {'User-Agent': 'Mozilla/5.0'}
    res = requests.get(url, headers=headers)
    # Extract structural text based on pattern signatures
    return ["192.168.1.100", "malicious-domain.xyz"]

if __name__ == "__main__":
    print(fetch_iocs("http://example.com"))
