
import requests
import json


OBJECT = 'shifts'
USER_ID = '34579877'

JSON_FILENAME = f'{OBJECT}.json'
CSV_FILENAME = f'{OBJECT}.csv'
USERID_ENDPOINT = 'login?show_pending=true'
TOKEN_BASE_ENDPOINT = 'https://api.login.wheniwork.com'
DATA_BASE_ENDPOINT = 'https://api.wheniwork.com'
API_KEY = 'd52d228fb87a9e406b32bd7ad67f47b1bd266c07'
EMAIL = 'brian@otiuminc.org'
PASSWORD = 'Meridian208.83646'


def get_token(url):
    try:
        header = {
            "W-Key": API_KEY,
            "content-type": "application/json"
        }
        data = json.dumps({
            "email": EMAIL,
            "password": PASSWORD
        })
        response = requests.post(url+'/login', data=data, headers=header)
        if not response.ok:
            raise Exception('authentication failure')
    except Exception as e:
        print('get token failure: ' + str(e))
        return 0
    global TOKEN
    TOKEN =  response.json()['token']
    return 1


def get_data(url):
    header = {
        "Authorization": f"Bearer {TOKEN}",
        "W-UserId": USER_ID
    }

    response = requests.get(url, headers=header)
    if not response.ok:
        print('get data failure')
        return 0
    global DATA
    DATA = response.json()
    return 1


def get_user_ids(url):
    header = {
        "Authorization": f"Bearer {TOKEN}",
        "Host": "api.wheniwork.com"
    }

    response = requests.get(url, headers=header)

    if not response.ok:
        print('get data failure')
        return 0
    print('user ids:')
    for i in response.json()['users']:
        print(i['id'])
    return 1


def write_data(json_filename):
    with open(filename, 'at') as f:
        f.write(f"{DATA}")


get_token(TOKEN_BASE_ENDPOINT)
get_user_ids(DATA_BASE_ENDPOINT + '/2/' + USERID_ENDPOINT)
get_data(DATA_BASE_ENDPOINT + '/2/' + OBJECT)
write_data(JSON_FILENAME)
