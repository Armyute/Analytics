
import requests
import json
import pandas as pd
import os


OBJECT = 'account'

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


def get_user_ids(url):
    header = {
        "Authorization": f"Bearer {TOKEN}",
        "Host": "api.wheniwork.com"
    }

    response = requests.get(url, headers=header)

    if not response.ok:
        print('get data failure')
        return 0
    global user_ids
    user_ids = []
    for i in response.json()['users']:
        user_ids.append(str(i['id']))
    return 1


def get_data(url):
    global DATA
    DATA = pd.DataFrame()

    for i in user_ids:
        header = {
            "Authorization": f"Bearer {TOKEN}",
            "W-UserId": f"{i}"
        }

    # use params for shifts and times only
    
       # params = {
       #     "start": "now - 365 days", # shifts only allows 365 days
       #     "end": "now"
            #"show_deleted": "true"
       #     }

        response = requests.get(url, headers=header)#, params=params)
        if not response.ok:
            print('get data failure')
            return 0

        RESP_DATA = response.json()
        NORM_DATA = pd.json_normalize(RESP_DATA[f'{OBJECT}'], sep='_')
        DATA = DATA.append(NORM_DATA)
    return 1


def write_data(json_filename):
    with open(json_filename, 'w') as f:
        json.dump(DATA, f)
    return 1


def write_csv(csv_filename):
    path = r'\Users\armst\OneDrive\Boxhead\Otium\Data\WhenIWork\\'
    DATA.to_csv(path+csv_filename, index=False)


get_token(TOKEN_BASE_ENDPOINT)
get_user_ids(DATA_BASE_ENDPOINT + '/2/' + USERID_ENDPOINT)
get_data(DATA_BASE_ENDPOINT + '/2/' + OBJECT)
write_csv(CSV_FILENAME)
#write_data(JSON_FILENAME)
