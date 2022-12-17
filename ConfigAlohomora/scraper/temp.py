import requests
import csv
from bs4 import BeautifulSoup

current_category_id = 200
# Define the URL of the website to scrape
URL = "https://sollux.pl"

# Make an HTTP request to the website
response = requests.get(URL)

# Parse the HTML content of the website
soup = BeautifulSoup(response.text, "html.parser")

# Extract the categories and subcategories from the website
menu_categories = soup.find("nav", id="menu_categories")

menu_categories_list_main = menu_categories.find("ul", class_="navbar-nav mx-md-n2")

menu_categories_list = menu_categories_list_main.find_all("li", class_="nav-item", recursive=False)

with open("categories.csv", "w", newline="", encoding='utf-8') as csvfile:
    fieldnames = ["category_id", "category_namę", "parent_category_name", "is_parent", "meta_category_name" , "source_url" , "category_description"]
    writer = csv.DictWriter(csvfile, delimiter=";", fieldnames=fieldnames)
    writer.writeheader()

#print(menu_categories_list[0].get_text())


    for category in menu_categories_list:
        title = category.find("a").get_text()
        link = category.find(href=True)['href']
        print(title)
        category_response = requests.get(URL+link)
        category_soup = BeautifulSoup(category_response.text, "html.parser")
        try: 
            category_description = category_soup.find("div", class_="search_categoriesdescription_sub cm skeleton").get_text()
        except (AttributeError):
            category_description = ""
        print(category_description)
        print(link)
        current_category_id += 1
        writer.writerow({
                "category_id": current_category_id,
                "category_namę": title,
                "parent_category_name": "Baza",
                "is_parent": 1,
                "meta_category_name": title,
                "source_url": link,
                "category_description": category_description
            })
        subcategory_groups = category.find_all("ul", class_="navbar-subsubnav")
        for subcategory_group in subcategory_groups:
            subcategory_group_subcategories = subcategory_group.find_all("li", class_="nav-item")
            for subcategory in subcategory_group_subcategories:
                subcategory_name = subcategory.get_text()
                subcategory_link = subcategory.find(href=True)['href']
                print(subcategory_link)
                print(title + " - " + subcategory_name)
                try:
                        
                    #go to subcategory url to grab description
                    subcategory_response = requests.get(URL+subcategory_link)
                    subcategory_soup = BeautifulSoup(subcategory_response.text, "html.parser")
                    subcategory_description = subcategory_soup.find("div", class_="search_categoriesdescription_sub cm skeleton").get_text()
                except (AttributeError):
                    subcategory_description = ""
                print(subcategory_description)
                current_category_id += 1
                writer.writerow({
                        "category_id": current_category_id,
                        "category_namę": subcategory_name,
                        "parent_category_name": title,
                        "is_parent": 0,
                        "meta_category_name": (title + "-" + subcategory_name),
                        "source_url": subcategory_link,
                        "category_description": subcategory_description
                    })
    


