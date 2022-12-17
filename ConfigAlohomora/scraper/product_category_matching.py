import requests
import csv
from bs4 import BeautifulSoup

URL = "https://sollux.pl"
current_product_id = 500


product_array = []

    
with open("categories.csv", "r", newline="", encoding='utf-8') as csvfile:
    fieldnames = ["category_id", "category_namę", "parent_category_name", "is_parent", "meta_category_name" , "source_url" , "category_description"]
    category_reader = csv.DictReader(csvfile, delimiter=";", fieldnames=fieldnames)
    header_read = 0;
    for row in category_reader:
        if header_read == 1:
            print("ID: " + row.get("category_id"))
            category_url = URL + row.get("source_url")
            print("URL: " + category_url)
            try:
                #load content of category page first
                category_response = requests.get(category_url)
                category_soup = BeautifulSoup(category_response.text, "html.parser")
                category_pagination = category_soup.find("ul", class_="s_paging__item pagination d-flex mb-2 mb-sm-3")
                #counting pages to scrap in single category
                category_pagination_buttons = category_pagination.find_all("li")
            except (AttributeError):
                print("")#exception for no pagination
            if category_pagination==None:
                category_pages_number=0
            else:
                category_pages_number = (int)(category_pagination_buttons[-2].get_text())
                #second to last element is last page button with number written in it
                #last is right arrow
                
            #listing product links from category page first
            products_in_category = category_soup.find_all("a", class_="product__name", href=True)
            all_product_links_in_category=[]
            for prod in products_in_category:
                all_product_links_in_category.append(prod['href'])
                #appending links to array, preparing for more links from other pages in this category
            
            #listing products from next pages in this category
            for pagenum in range(1,category_pages_number):
                category_page_url = category_url + "?counter=" + str(pagenum)
                print(category_page_url)
                
                category_page_response = requests.get(category_page_url)
                category_page_soup = BeautifulSoup(category_page_response.text, "html.parser")
                
                products_in_category_page = category_page_soup.find_all("a", class_="product__name", href=True)
                
                for prod in products_in_category_page:
                    all_product_links_in_category.append(prod['href'])
                    #appending next links to the same list that has links from first page of category
                    #now appending from current pagenum
                
            
                
            #links from all pages of this category appended into list of all product links
            print("Number of products: " + str(len(all_product_links_in_category)))
            
            
            
            
            #
            
            #checking each product from this category for existance in global product list
            for product_link in all_product_links_in_category:
                product_known = 0
                #checking the global stored product_array for product with the same link
                for product_stored in product_array:
                    if product_stored["product_link"] == product_link:
                        product_known = 1
                        product_stored["category_names"].append(row.get("category_id"))
                if product_known==0:
                    #if product link is new, not in the stored array, add new entry and insert the link
                    #along with preparation of inner list for category IDs that the link was seen in
                    product_array.append({
                        "product_link": product_link,
                        "category_names": []
                        })
                    #after new structure with empty ID list was created find it again and insert the category ID to the list
                    for product_stored in product_array:
                        if product_stored["product_link"] == product_link:
                            product_stored["category_names"].append(row.get("category_id"))
                
        header_read = 1
        #
            
            
#check in what category IDs the product 0 is
print(product_array[0]["category_names"])



#write content of stored product_array to the csv file
with open("products_link_list.csv", "w", newline="", encoding='utf-8') as csvfile2:
    fieldnames = ["id", "name", "description", "price", "shipping", "enabled", "quantity", "source_url", "category_ids"]
    product_writer = csv.DictWriter(csvfile2, delimiter=";", fieldnames=fieldnames)
    product_writer.writeheader()
    
    for product in product_array:
        current_product_id += 1
        link = URL+product["product_link"]
        category = ','.join(map(str, product["category_names"]))
        #print(category)
        
        product_writer.writerow({
                "id": current_product_id,
                "name": ("temp prod name with ID: "+str(current_product_id)),
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "price": "399,99",
                "shipping": "dhl,inpost",
                "enabled": "1",
                "quantity": "1200",
                "source_url": link,
                "category_ids": category
            })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    