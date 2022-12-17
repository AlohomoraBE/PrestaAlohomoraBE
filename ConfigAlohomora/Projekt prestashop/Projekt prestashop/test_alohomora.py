import unittest
import os
import random
import string
import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains


EMAIL_ADDRESS = "rvp43349@xcoxc.com"
NAME = "Andrzej"
SURNAME = "Lubowicz"
LOGIN = "TestUser41"
PWD = "MySuperCoolPassword1"
#driver = webdriver.Chrome(os.getcwd() + "\chromewebdriver.exe")
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()


class TestAlohomoraShop(unittest.TestCase):

    def login(self):
        driver.get('https://prestaprojectone.bajer.me/logowanie')
        
        email = driver.find_element(By.XPATH, "//input[@name='email']")
        email.send_keys('muyuausnjgejmtxfbp@tmmwj.net')

        password = driver.find_element(By.XPATH, "//input[@name='password']")
        password.send_keys('muyuausnjgejmtxfbp')

        password = driver.find_element(By.XPATH, "//button[@id='submit-login']")
        password.click()

##    def test_0(self):
##        self.login()
##        driver.close()
    
    def test_1_add_products_to_cart(self):

        with open('product_list.txt') as f:
            products = f.readlines()

        i = 0
        
        for product_link in products:
            i+=1
            items_to_buy = str(random.randint(1, 4))
            
            # Open link
            driver.get(product_link)
            
            element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CLASS_NAME, 'an_hurry_up-count')))
            
            # Change quantity
            qty = driver.find_element(By.NAME, "qty")
            qty.send_keys(Keys.CONTROL + "a")
            qty.send_keys(Keys.DELETE)
            qty.send_keys(items_to_buy)


            element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="add-to-cart-or-refresh"]/div[2]/div[2]/div/button')))
            
            # Add to cart
            add_to_cart = driver.find_element(By.XPATH, '//*[@id="add-to-cart-or-refresh"]/div[2]/div[2]/div/button')
            add_to_cart.click()

            if i==1:
                element = WebDriverWait(driver, 10).until(
                    EC.presence_of_element_located((By.XPATH, '//*[@id="js-cart-sidebar"]/div/ul/li/div[1]/div/div/input')))
            else:
                element = WebDriverWait(driver, 10).until(
                    EC.presence_of_element_located((By.XPATH, f'//*[@id="js-cart-sidebar"]/div/ul/li[{i}]/div[1]/div/div/input')))
            
            # Check if added
            if i==1:
                ite_in_cart = driver.find_element(By.XPATH, '//*[@id="js-cart-sidebar"]/div/ul/li/div[1]/div/div/input')

            else:
                ite_in_cart = driver.find_element(By.XPATH, f'//*[@id="js-cart-sidebar"]/div/ul/li[{i}]/div[1]/div/div/input')

            self.assertTrue(ite_in_cart.get_attribute("value"), items_to_buy)
            

    def test_2_remove_product_from_cart(self):
        ite_to_remove = 1
        
        driver.get('https://prestaprojectone.bajer.me/')

        cart = driver.find_element(By.XPATH, '//*[@id="_desktop_cart"]/div/div[1]/a/span[1]')
        cart.click()
        
        element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="js-cart-sidebar"]')))
        
        cart_items = driver.find_element(By.XPATH, '//*[@id="js-cart-sidebar"]/div/ul')
        items = cart_items.find_elements(By.TAG_NAME, "li")

        for i in range(1,len(items)):
            if i == ite_to_remove:
                remove_ite = driver.find_element(By.XPATH, '//*[@id="js-cart-sidebar"]/div/ul/li[1]/div[2]/a')
                driver.get(remove_ite.get_attribute("href"))
                break
        

    def test_3_register_new_account(self):
        driver.get('https://prestaprojectone.bajer.me/logowanie?create_account=1')
        time.sleep(3)
        
        sex = driver.find_element(By.XPATH, "//input[@value='1'][@name='id_gender']")
        sex.click()

        first_name = driver.find_element(By.XPATH, "//input[@name='firstname']")
        first_name.send_keys(NAME)

        last_name = driver.find_element(By.XPATH, "//input[@name='lastname']")
        last_name.send_keys(SURNAME)

        email = driver.find_element(By.XPATH, "//input[@name='email']")
        email.send_keys(EMAIL_ADDRESS)

        pwd = driver.find_element(By.XPATH, "//input[@name='password']")
        pwd.send_keys(PWD)

        customer_privacy = driver.find_element(By.XPATH, "//input[@name='customer_privacy']")
        customer_privacy.click()

        psgdpr = driver.find_element(By.XPATH, "//input[@name='psgdpr']")
        psgdpr.click()

        submit = driver.find_element(By.XPATH, '//*[@id="customer-form"]/footer/button')
        submit.click()

        driver.get('https://prestaprojectone.bajer.me/dane-osobiste')

        try:
            driver.find_element(By.XPATH, "//input[@name='firstname']")
        except selenium.common.exceptions.NoSuchElementException:
            self.assertTrue(False)

        test_name = driver.find_element(By.XPATH, "//input[@name='firstname']")
        test_name = test_name.get_attribute("value")
        self.assertEqual(test_name, NAME)                
        
    def test_4_create_order(self):
        driver.get('https://prestaprojectone.bajer.me/zam\u00F3wienie')
        actions = ActionChains(driver)

        time.sleep(3)

        # Enter delivery address
        address = driver.find_element(By.XPATH, "//input[@name='address1']")
        address.send_keys("Testowy 1A")

        postcode = driver.find_element(By.XPATH, "//input[@name='postcode']")
        postcode.send_keys("12-345")

        city = driver.find_element(By.XPATH, "//input[@name='city']")
        city.send_keys("Gdansk")

        submit = driver.find_element(By.XPATH, '//*[@id="delivery-address"]/div/footer/button')
        submit.click()

        # Select delivery method
        try:
            delivery_method = driver.find_element(By.XPATH, "//input[@id='delivery_option_21']")
        except selenium.common.exceptions.NoSuchElementException:
            delivery_method = driver.find_element(By.XPATH, "//input[@id='delivery_option_19']")

        actions.move_to_element(delivery_method).perform()
        delivery_method.click()
        
        submit = driver.find_element(By.XPATH, '//*[@id="js-delivery"]/button')
        submit.click()
        
        # Select payment method
        driver.implicitly_wait(10)
        pmnt_method = driver.find_element(By.XPATH, "//label[@for='payment-option-2']")
        pmnt_method.click()
        #actions.move_to_element(pmnt_method).click().perform()
        
        terms = driver.find_element(By.XPATH, '//*[@id="conditions_to_approve[terms-and-conditions]"]')
        terms.click()

        # Submit order
        submit_order = driver.find_element(By.XPATH, '//*[@id="payment-confirmation"]/div[1]/button')
        submit_order.click()

    def test_5_check_order_status(self):
        #self.login()
        
        driver.get('https://prestaprojectone.bajer.me/historia-zamowien')

        tbl_row = driver.find_element(By.XPATH, '//*[@id="content"]/table/tbody/tr[1]/td[4]')
        self.assertEqual(tbl_row.text, "Oczekiwanie na płatność przy odbiorze")

        

if __name__ == '__main__':
    unittest.main()
    driver.quit()
