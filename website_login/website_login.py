from selenium import webdriver
import getpass
import pickle


my_google_email = 'greg@otiuminc.com'
my_google_password = '%%9HW$nP6@LT'

chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("user-data-dir=C:\\Users\\"+getpass.getuser()+"\\AppData\\Local\\Google\\Chrome\\User Data\\Default")  # this is the directory for the cookies
driver = webdriver.Chrome(chrome_options=chrome_options)

def login(url):
    driver.get(url)
    driver.find_element_by_id(usernameId).send_keys(email)
    driver.find_element_by_id(passwordId).sned_keys(password)

def download(url,download):
    #driver.get(url)
    driver.execute_script(window.open(url))
    driver.find_elemen_by_id(download).click()

login('https://accounts.google.com/signin')
#download('https://internal.crumbl.com/page/delivery', "download")


def save_cookie(driver, path):
    with open(path, 'wb') as filehandler:
        pickle.dump(driver.get_cookies(), filehandler)

def load_cookie(driver, path):
     with open(path, 'rb') as cookiesfile:
         cookies = pickle.load(cookiesfile)
         for cookie in cookies:
             driver.add_cookie(cookie)
