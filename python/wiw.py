
import requests
import jwt

api_key = 'd52d228fb87a9e406b32bd7ad67f47b1bd266c07'
email = 'brian@otiuminc.org'
password = 'Meridian208.83646'
endpoint = 'https://api.login.wheniwork.com/2'
app = '1'
iat = '1619231599'
login = '11573181'
pid = '11573181'
algorithm = 'RS256'
url = endpoint+'/login'
params = {'email': email, 'password': password}
head = {'W-Key': api_key}
resp = requests.post(url, json=params, headers=head)
token = jwt.encode({'email': email, 'password': password}, api_key)
token = jwt.encode({'app': app, 'iat': iat, 'login': login, 'pid': pid}, api_key, algorithm)

# Get Data
head = {'W-Token': 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHAiOiIxIiwiaWF0IjoxNjIwNTIzNjQzLCJsb2dpbiI6IjExNTczMTgxIiwicGlkIjoiMTE1NzMxODEifQ.pgVu6dy5Rxr5dNguybvwEQgD8nWDsM4CtoaJ83yHcQZqrFIYW0RdMlPAs4nzdveNpxpNdC44zbRZXvrIsOU6mKvoiqoVm7XCeBu6zYb9TswcaXL8KP_Rpr7VHQhg1RRc_8QYImLJ-uyJCL5KeRaQ6AOzFUHwh0-rYwb2MWoSuiCCkHd6A6yBLlcuNipl0Gb34YBAFHjBuz-1Rq6fy-Jwp85ICkz5uND_6RvgY-lAXP3QajkgE3veCCZKJgF9ZpaH2TQctnjF3hkPg9ICgwA2ky4SsXW7Z6ad0pJT_qjSPhXJVetu6XN22DEJXIkeANTrnfcnV9Zyfvd12KK6Hu5mqw'}
endpoint = 'https://api.wheniwork.com/2'
url = endpoint+'/users'
resp = requests.get(url, params=head)
resp

os.chdir("/Users/armst/OneDrive/Boxhead LLC/Otium/Data/WhenIWork")
with open("wiw_users.json", "w") as outfile:
    json.dump(users, outfile)



curl -X POST \
  https://api.login.wheniwork.com/login \
  -H 'W-Key: d52d228fb87a9e406b32bd7ad67f47b1bd266c07' \
  -H 'content-type: application/json' \
  -d '{"email":"brian@otiuminc.org","password":"Meridian208.83646"}'

curl -X GET \
  'https://api.wheniwork.com/2/login?show_pending=true' \
  -H 'Host: api.wheniwork.com' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHAiOiIxIiwiaWF0IjoxNjE5MjI5NjkzLCJsb2dpbiI6IjExNTczMTgxIiwicGlkIjoiMTE1NzMxODEifQ.l9F_-BxZevfSYUQglGi6lAXUr-yxI1pnIdxddzWWDbDBOzu2HzovbBOjTDrzkXWBXgoQAd2JbRLbnOr5wWBBpaNnIImZU81GJGYnBxQGRN4KmAxODI11cp54dT-viIzWkpl9XzGXijmbYHWjLlLRAR5_N0klzfd0na6AQ5GrU92XR77lX2XPE20xwb6shdBj4_-VZVyzyOjJqOvwGns7pDLMAAnn8N2Wzibvll9FdxF0TCSRTUvyBjF3dTEIFmBfDmxioDQhnOvcA9eHVf7mF50ke7_niSWQvB4tMNlOrZ-oq3cvWWxQbfpztDRRnobwAsuwSbS76QkwMoX47J27fA'

curl -X GET \
  https://api.wheniwork.com/2/users \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHAiOiIxIiwiaWF0IjoxNjE5MjI5NjkzLCJsb2dpbiI6IjExNTczMTgxIiwicGlkIjoiMTE1NzMxODEifQ.l9F_-BxZevfSYUQglGi6lAXUr-yxI1pnIdxddzWWDbDBOzu2HzovbBOjTDrzkXWBXgoQAd2JbRLbnOr5wWBBpaNnIImZU81GJGYnBxQGRN4KmAxODI11cp54dT-viIzWkpl9XzGXijmbYHWjLlLRAR5_N0klzfd0na6AQ5GrU92XR77lX2XPE20xwb6shdBj4_-VZVyzyOjJqOvwGns7pDLMAAnn8N2Wzibvll9FdxF0TCSRTUvyBjF3dTEIFmBfDmxioDQhnOvcA9eHVf7mF50ke7_niSWQvB4tMNlOrZ-oq3cvWWxQbfpztDRRnobwAsuwSbS76QkwMoX47J27fA'
  -H 'W-UserId: 11573181'
