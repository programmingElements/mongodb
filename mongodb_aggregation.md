What is Aggregation in MongoDB?
Aggregation is a way of processing a large number of documents in a collection by means of passing them through different stages. The stages make up what is known as a pipeline. The stages in a pipeline can filter, sort, group, reshape and modify documents that pass through the pipeline.

Example:1
---------

1. Retrieve the Electronics category documents?

db.products.aggregate([
    {
        $match: {
            category: "Electronics"
        }
    }
])

2. List out number of Electronics category documents?

db.products.aggregate([
    {
        $match: {
            category: "Electronics"
        }
    },
    {
        $count: "documentsCount"
    }
])


$group:
-------

syntax:
-------
{
 $group:
   {
     _id: <expression>, // Group key
     <field1>: { <accumulator1> : <expression1> },
     ...
   }
 }


Examples:
---------
1. Group the Products name according to the category?

{
 $group:
   {
     _id: "$category", // Group key
     products: { "$push" : "$product_name" }
   }
}

2. Find the Sum of products price according to the category group?

{
 $group:
   {
     _id: "$category", // Group key
     totalPrice: { "$sum" : "$price" }
   }
}

3. Find the count of products documents according to the category group?

{
 $group:
   {
     _id: "$category", // Group key
     totalDocs: { "$sum" : 1 }
   }
}

4. Find the Avg Price of the products prices according to the category group?

{
 $group:
   {
     _id: "$category", // Group key
     avgPrice: { "$avg" : "$price" }
   }
}

Group the status field in the products collection and count the docs ?

db.products.aggregate([
    {
        $group:{
            _id: "$status",
            countOfDocs: {
                $sum: 1
            }
        }
    }
])


sort:
-----
sort aggregate is to sort the values descending (or) ascending order

1. sort the price of products according to ascending or descending order


2. sort the totalPrice of the category wise in products


3. Find the top 5 price values of the products

$push
-----
The $push stage adds elements to an array fields within documents.

{$push: <expression>}

db.products.aggregate([
  {
    $group: {
      _id: {
        company: "$company"
      },
      products: {
        $push: "$name"
      }
    }
  }
])

sales collection

[
{ "_id" : 1, "item" : "abc", "price" : 10, "quantity" : 2, "date" : ISODate("2014-01-01T08:00:00Z") },
{ "_id" : 2, "item" : "jkl", "price" : 20, "quantity" : 1, "date" : ISODate("2014-02-03T09:00:00Z") },
{ "_id" : 3, "item" : "xyz", "price" : 5, "quantity" : 5, "date" : ISODate("2014-02-03T09:05:00Z") },
{ "_id" : 4, "item" : "abc", "price" : 10, "quantity" : 10, "date" : ISODate("2014-02-15T08:00:00Z") },
{ "_id" : 5, "item" : "xyz", "price" : 5, "quantity" : 10, "date" : ISODate("2014-02-15T09:05:00Z") },
{ "_id" : 6, "item" : "xyz", "price" : 5, "quantity" : 5, "date" : ISODate("2014-02-15T12:05:10Z") },
{ "_id" : 7, "item" : "xyz", "price" : 5, "quantity" : 10, "date" : ISODate("2014-02-15T14:12:12Z") }
]

db.sales.aggregate([
  {
    $group: {
      _id: "$price",
      items: {
        $push: "$item"
      }
    }
  }
])


products collection
-------------------

[
  {
    "product_name": "Smartphone X",
    "category": "Electronics",
    "price": 799.99,
    "colors": ["#000000", "#33CCFF", "#FF0000"]
  },
  {
    "product_name": "Running Shoes",
    "category": "Footwear",
    "price": 69.99,
    "colors": ["#009933", "#CC0000", "#6666FF"]
  },
  {
    "product_name": "Coffee Maker Pro",
    "category": "Home and Kitchen",
    "price": 129.99,
    "colors": ["#993300", "#CCCCCC", "#FF6600"]
  },
  {
    "product_name": "Winter Jacket",
    "category": "Clothing",
    "price": 149.99,
    "colors": ["#336699", "#FF9900", "#990033"]
  },
  {
    "product_name": "Gaming Laptop",
    "category": "Electronics",
    "price": 1499.99,
    "colors": ["#000066", "#FFCC00", "#33FF33"]
  },
  {
    "product_name": "Yoga Mat",
    "category": "Fitness",
    "price": 29.99,
    "colors": ["#9900FF", "#FF3366", "#66CC66"]
  },
  {
    "product_name": "HD Television",
    "category": "Electronics",
    "price": 599.99,
    "colors": ["#FF6600", "#0066CC", "#FFCC33"]
  },
  {
    "product_name": "Designer Sunglasses",
    "category": "Fashion",
    "price": 129.99,
    "colors": ["#663300", "#999999", "#FF9900"]
  },
  {
    "product_name": "Backpack Adventure",
    "category": "Outdoor",
    "price": 79.99,
    "colors": ["#3366FF", "#FF0033", "#99CC00"]
  },
  {
    "product_name": "Home Office Desk",
    "category": "Furniture",
    "price": 249.99,
    "colors": ["#663366", "#CC6600", "#33FF99"]
  },
  {
    "product_name": "Classic Watch",
    "category": "Accessories",
    "price": 89.99,
    "colors": ["#006666", "#FF3300", "#99CC33"]
  },
  {
    "product_name": "Wireless Earbuds",
    "category": "Electronics",
    "price": 79.99,
    "colors": ["#FFCC00", "#3399FF", "#CC3366"]
  },
  {
    "product_name": "Casual T-Shirt",
    "category": "Clothing",
    "price": 19.99,
    "colors": ["#990066", "#FF6633", "#009933"]
  },
  {
    "product_name": "Travel Luggage Set",
    "category": "Travel",
    "price": 199.99,
    "colors": ["#336633", "#FFCC66", "#663399"]
  },
  {
    "product_name": "Digital Camera",
    "category": "Electronics",
    "price": 499.99,
    "colors": ["#CC3333", "#339966", "#FF9900"]
  }
]
--------------------------------------------------------------
{
    _id: ObjectId("65a4feb739573e58cb3700a8"),
    product_name: 'Smartphone X',
    category: 'Electronics',
    price: 799.99,
    colors: '#000000'
  },
  {
    _id: ObjectId("65a4feb739573e58cb3700a8"),
    product_name: 'Smartphone X',
    category: 'Electronics',
    price: 799.99,
    colors: '#33CCFF'
  },
  {
    _id: ObjectId("65a4feb739573e58cb3700a8"),
    product_name: 'Smartphone X',
    category: 'Electronics',
    price: 799.99,
    colors: '#FF0000'
  },


category: "Electronics"
allColors: ['#000000', '#33CCFF', '#FF0000']
products: ['Smartphone X','Smartphone X','Smartphone X' ]
 
Examples:
---------
1. Organise the name of the products of each category

 db.product2.aggregate([ { $group: { _id: "$category", products: {$push: "$product_name"} } }])

2. Organise the colors (or) product_name of each category

db.product2.aggregate([ { $group: { _id: "$category", allcolors: {$push:"$colors"},  } }])

      (or)

 db.product2.aggregate([ { $unwind: "$colors" },{ $group: { _id: "$category", allcolors: {$push:"$colors"},  } }])

      (or)
  
db.product2.aggregate([ { $unwind: "$colors" },{ $group: { _id: "$category", products: {$push: "$product_name"},  } }])

      (or)

db.product2.aggregate([ { $unwind: "$colors" },{ $group: { _id: "$category", products: {$addToSet: "$product_name"},allColors: {$push:"$colors"}  } }])


Find the size of the array using $size

db.product2.aggregate([ { $unwind: "$colors" },{ $group: { _id: "$category", products: {$addToSet: "$product_name"},allColors: {$push:"$colors"}  } }, {$project: {_id:1,products:1,colorLength:{$size:"$allColors"}}}])


$limit & $skip
--------------
This stages are used to pagination, limiting and skipping results.

{$limit:<positive integer>}


db.product2.aggregate([
  {$skip:10},
  {$limit:3}
]);




$lookup:
--------



syntax:
-------
{
  $lookup: {
    from: <collection to join>,
    localField: <field from the input documents>,
    foreignField: <field from the documents of the "from" collection>,
    as: <output array field>
  }
}

books.json
----------
[
  {"_id": 1,"title": "Soli Sorabjee: Life and Times","author_id": 100,"genre": "Classic"},{"_id": 2,"title": "The Queen of Indian Pop","author_id": 101,"genre": "Dystopian"},
  {"_id": 3,"title": "On Board: My Years in BCCI","author_id": 102,"genre": "Classic"},
  {"_id": 4,"title": "Tomb of Sand","author_id": 103,"genre": "Dystopian"}
]

authors.json
------------
[
  {"_id": 100,"name": "Abhinav Chandrachud","birth_year": 1896},
  {"_id": 101,"name": "Usha Uthup","birth_year": 1903},
  {"_id": 102,"name": "Ratnakar Shetty's","birth_year": 1926},
  {"_id": 103,"name": "Geetanjali Shree's","birth_year": 1945}
]

Example of lookup
-----------------

[
  {
    $lookup: {
      from: "authors",
      localField: "author_id",
      foreignField: "_id",
      as: "author_info"
    }
  },
  {
    $addFields: {
      author_info: {
        $first: "$author_info"
      }
    }
  }
]

[
  {
    $lookup: {
      from: "authors",
      localField: "author_id",
      foreignField: "_id",
      as: "author_info"
    }
  },
  {
    $addFields: {
      author_info: {
        $arrayElemAt: ["$author_info", 0]
      }
    }
  }
]


Code:
-----
 db.books.aggregate([
   {
     $lookup: {
       from: "authors",
       localField: "author_id",
       foreignField: "_id",
       as: "author_info"
     }
   },
   {
     $addFields: {
       author_info: {
         $arrayElemAt: ["$author_info", 0]
       }
     }
   }
 ])




categories.json:
----------------
[
  {
    "_id": 1000,
    "name": "Clothes"
  },
  {
    "_id": 1001,
    "name": "Electronics"
  },
  {
    "_id": 1002,
    "name": "Furniture"
  },
  {
    "_id": 1003,
    "name": "Footwear"
  },
  {
    "_id": 1004,
    "name": "Appliances"
  }
]

products.json:
--------------
[
  {
    "_id": 1,
    "product_name": "Laptop",
    "category": 1001,
    "count": 3,
    "brand": "Kenovo"
  },
  {
    "_id": 2,
    "product_name": "Running Shoes",
    "category": 1003,
    "count": 4,
    "brand": "Tata"
  },
  {
    "_id": 3,
    "product_name": "Coffee Maker",
    "category": 1004,
    "brand": "Menco"
  },
  {
    "_id": 4,
    "product_name": "Bookshelf",
    "category": 1002,
    "brand": "Nisilk"
  },
  {
    "_id": 5,
    "product_name": "Dress",
    "category": 1000,
    "brand": "Penty"
  }
]



Examples:
---------
db.products.aggregate([
 {
  $lookup: {
     from: "categories",
     localField: "category",
     foreignField: "_id",
     as: "Categories"
   }
 },
 {
   $addFields: {
       Categories: {
           $arrayElemAt: ["$Categories",0]
       }
   }
 }
 ])


db.products.aggregate([ 
  { $lookup: 
      { 
        from: "categories", 
        localField: "category", 
        foreignField: "_id", 
        as: "Categories" 
      } 
  }, 
  { 
    $addFields: 
      { 
        Categories: 
          { 
            $arrayElemAt: ["$Categories", 0] 
          } 
      } 
  }, 
  {
    $project:
      {
        product_name:1,
        brand:1,
        "Categories.name":1
      }
  }
])



db.books.aggregate([
  {
    $lookup: {
      from: "authors",
      localField: "author_id",
      foreignField: "_id",
      as: "authors_info"
    }
  },
  {
    $addFields: {
      authors_info: {
        $arrayElemAt: ["$authors_info", 0]
      }
    }
  },
  {
    $project: {
      title: 1,
      genre: 1,
      "authors_info.name": 1
    }
  }
])


