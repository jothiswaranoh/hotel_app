# Users API:
```
{
  "Users": {
    "Id": 1,
    "username": "abc",
    "Email": "abc@gmail.com",
    "Image": "url",
    "Phone": 1234567890
  }
}
```
# Food API:
```
{
  "Foods": {
    "Id": 1,
    "Name": "aaa",
    "Pic": "url"
  }
}
```
# Category API:
```
{
  "Category": {
    "Id": 1,
    "category_name": "abc",
    "image_url": "url"
  }
}
```
# Table API:
```
{
  "Table": {
    "Id": 1,
    "table_no": 1,
    "table_position": 2,
    "table_capacity": 4
  }
}
```
# Orders API:
```
{
  "orders_list": {
    "Id": 1,
    "list_of_foods": [
      {
        "name": "dosa",
        "status": "preparing"
      },
      {
        "name": "idly",
        "status": "served"
      }
    ]
  }
}
```

Get Users:
https://foodapp.selfmade.one/food_hotel/sample.php?method=getUsers

Get Foods:
https://foodapp.selfmade.one/food_hotel/sample.php?method=getFoods

Get Categories:
https://foodapp.selfmade.one/food_hotel/sample.php?method=getCategory

Get Tables:
https://foodapp.selfmade.one/food_hotel/sample.php?method=getTable

Get Orders:
https://foodapp.selfmade.one/food_hotel/sample.php?method=getOrders

