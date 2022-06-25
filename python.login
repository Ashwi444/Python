 from selenium import webdriver
import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import csv
import urllib.parse

url = 'https://shopee.com.my/'

driver = webdriver.Chrome('E:/users/Asashin/Desktop/Bots/others/chromedriver.exe')
driver.get(url)

actions = ActionChains(driver)
wait = WebDriverWait(driver, 10)
time.sleep(1)

lan=driver.find_element_by_xpath('//button[text()="English"]')
if lan.is_displayed:
    lan.click()
    time.sleep(0.5)

ads=driver.find_element_by_class_name('shopee-popup__close-btn')
if ads.is_displayed:
    ads.click()
    time.sleep(0.5)

time.sleep(2)
firstLevelMenu = driver.find_element_by_xpath('//ul[@class="navbar__links"]')
actions.move_to_element(firstLevelMenu).perform();

secondLevelMenu = driver.find_element_by_xpath('//li[contains(text(), "Login")]');
secondLevelMenu.click();

time.sleep(3)
f= open("account.csv","r")

for line in f :
      fields = line.split(",")

      a = fields[0]
      b = fields[1]
      c = fields[2]

      driver.find_element_by_xpath("//input[@type='text']").send_keys(str(a))
      driver.find_element_by_xpath("//input[@type='password']").send_keys(str(c))
      time.sleep(0.8)

      button = driver.find_element_by_xpath('//button[@class="_1BMmPI _37G57D _7h_6kj _1qIIqG _3JP5il"]')
      if button.is_displayed:
          button.click()
          time.sleep(2)
      else:
          continue

      time.sleep(1)

      ads2=driver.find_element_by_class_name('shopee-popup__close-btn')


      if ads2.is_displayed:
       ads2.click()
          time.sleep(0.5)
      try:
          banned = driver.switch_to_alert.text("Your account has been banned")
          banned2 = driver.switch_to_alert.text("Invalid Email")

          if banned.is_displayed():
            while True:
                  q= open ('Banned Accounts.txt',w)
                  File_object.write(a)

                  driver.get_element_by_class_name('input-with-status__input').clear()
                  driver.find_element_by_xpath("//input[@type='password']").clear()
          continue
      except:
          browser.driver.close();

