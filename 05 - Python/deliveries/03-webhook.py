import requests
URL='https://hooks.slack.com/services/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'
body={"text": "Python is awesome.\nAnd this is another line of python."}
response = requests.post(
    URL, json=body,
    headers={'Content-Type': 'application/json'}
)
print(response)