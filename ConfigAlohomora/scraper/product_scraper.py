import requests
import random
import csv
from bs4 import BeautifulSoup

URL = "https://sollux.pl"
product_array = []

#read link file
with open("products_link_list.csv", "r", newline="", encoding='utf-8') as csvfile:
    fieldnames = ["id", "name", "description", "price", "shipping", "enabled", "quantity", "source_url", "category_ids"]
    product_reader = csv.DictReader(csvfile, delimiter=";", fieldnames=fieldnames)
    header_read = 0;
    for row in product_reader:
        if header_read == 1:
            product_array.append({
                "id": row.get("id"), 
                "name": row.get("name"), 
                "description": "", 
                "specs": "",
                "price": "", 
                "tax_reg": "1",
                "photo_delete": "1",
                "dim_x": "",
                "dim_y": "",
                "dim_z": "",
                "weight": "",
                "image_url": "",
                "shipping": "dhl", 
                "enabled": "1", 
                "quantity": "", 
                "source_url": row.get("source_url"), 
                "category_ids": row.get("category_ids")
                })
        header_read = 1
#file closed


#product content scraping
for product in product_array:
    
    link = product["source_url"]
    product_page_response = requests.get(product["source_url"])
    product_page_soup = BeautifulSoup(product_page_response.text, "html.parser")
    
    #product name
    product["name"] = product_page_soup.find("h1", class_="product_name__name m-0").get_text()
    print(product["id"])
    #product price
    product["price"] = product_page_soup.find("strong", class_="projector_prices__price").get_text().split()[0].replace(",",".")
    #print(product["price"])
    #product description
    #product["description"] = product_page_soup.find("section", id="projector_longdescription").get_text().replace('\n','<br/>')
    product_description_text = product_page_soup.find("section", id="projector_longdescription").get_text().replace('\n','<br/>')
    product_description_soup = product_page_soup.find("section", id="projector_longdescription")
    product_description_headers = product_description_soup.find_all("span", style="font-size: 14pt;")
    product_description_text = "<p style=\"text-align: center;\"><span style=\"font-size: 10pt;\">" + product_description_text
    for header in product_description_headers:
        htext = header.get_text()
        product_description_text = product_description_text.replace(htext,str("<span style=\"text-align: center; font-size: 14pt;\"><strong>" + htext + "</strong></span>"))
    product_description_text = product_description_text + "</span></p>"
    product["description"] = product_description_text
    #print(product["description"])
    #product specs
    specs_section = product_page_soup.find("section", id="projector_dictionary")
    #product["specs"]
    specs_params_soup = specs_section.find_all("span", class_=("dictionary__name_txt"))
    specs_values_soup = specs_section.find_all("div", class_=("dictionary__value"))
    specs_string = ""
    for element in range(0,len(specs_params_soup)):
        specs_string += specs_params_soup[element].get_text() + ":"
        specs_string += specs_values_soup[element].get_text() + "::"
        specs_string += ","
    specs_string = specs_string[:-1]
    product["specs"] = specs_string
    #print(product["specs"])
    #product image
    product["image_url"] = URL+product_page_soup.find("img", class_="photos__photo", src=True)['src']
    #print(product["image_url"])
    #generated
    product["dim_x"] = str(random.randint(30,100))
    product["dim_y"] = str(random.randint(40,120))
    product["dim_z"] = str(random.randint(35,100))
    product["weight"] = str(random.randint(2,10))
    product["quantity"] = str(random.randint(2,47))
    #testing on one product
    #break;


#save all new data to new complete file
with open("products.csv", "w", newline="", encoding='utf-8') as csvfile:
    fieldnames = ["id", "name", "description", "specs", "price", "tax_reg", "photo_delete", "dim_x", "dim_y", "dim_z", "weight", "image_url", "shipping", "enabled", "quantity", "source_url", "category_ids"]
    product_writer = csv.DictWriter(csvfile, delimiter=";", fieldnames=fieldnames)
    product_writer.writeheader()
    for product in product_array:
        product_writer.writerow({
            "id": product["id"], 
            "name": product["name"], 
            "description": product["description"], 
            "specs": product["specs"],
            "price": product["price"], 
            "tax_reg": product["tax_reg"],
            "photo_delete": product["photo_delete"],
            "dim_x": product["dim_x"],
            "dim_y": product["dim_y"],
            "dim_z": product["dim_z"],
            "weight": product["weight"],
            "image_url": product["image_url"],
            "shipping": product["shipping"], 
            "enabled": product["enabled"], 
            "quantity": product["quantity"], 
            "source_url": product["source_url"], 
            "category_ids": product["category_ids"]
            })
        