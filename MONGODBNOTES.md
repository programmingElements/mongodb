Mongodb
-------
Download and Install : https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-windows/

Mongodb Shell : https://www.mongodb.com/try/download/shell

Extract the Mongodb shell folder and open the bin folder copy path set into the environment variables.

Install the vs code and download the mongodb plugin the vs code extensions.

open the cmd prompt : mongosh "mongodb://localhost:27017" 

we will get the mongodb access using the above command.

if the mongodb is localhost use the below command to open mongodb server : "mongosh"



commands of mongosh:
--------------------

1. show dbs; --> show the databases;
test> show dbs
admin   40.00 KiB
config  72.00 KiB
local   88.00 KiB

2. use admin; --> use database or create the database

test> show dbs
admin   40.00 KiB
config  72.00 KiB
local   88.00 KiB

test> use admin
switched to db admin

admin> use school
switched to db school

school> show dbs;
admin   40.00 KiB
config  72.00 KiB
local   88.00 KiB

3.
school> db.createCollection("students") --> create new collection
{ ok: 1 }

school> show dbs;
admin    40.00 KiB
config  108.00 KiB
local    88.00 KiB
school    8.00 KiB

4.
school> db.dropDatabase() --> dropping the Database
{ ok: 1, dropped: 'school' }
school> show dbs;
admin    40.00 KiB
config  108.00 KiB
local    88.00 KiB


5. Insert data into students collection

school> db.students.insertOne({name:"Spongebob",age:30,gpa:3.2})
{
  acknowledged: true,
  insertedId: ObjectId("64c29d96da92fc120eddcfb2")
}

6. To get the all documents from students collection

school> db.students.find()
[
  {
    _id: ObjectId("64c29d96da92fc120eddcfb2"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]

7. To insert two or more documents into the students collection( mongodb)

school> db.students.insertMany([{name:"Patrick",age:25,gpa:1.8}, {name:"Sandy",age:34,gpa:4.0}, {name:"Gary",age:20,gpa:2.5}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("64c29e9bda92fc120eddcfb3"),
    '1': ObjectId("64c29e9bda92fc120eddcfb4"),
    '2': ObjectId("64c29e9bda92fc120eddcfb5")
  }
}

8. To get all documents into students collection

school> db.students.find()



9. To collection in the database write below command: 

school> show collections;
students
school>

10. To insert one document into students collection with all data.

school> db.students.insertOne({name: "Chinny", age: 32, gpa: 2.8, fullTime: false, registerDate: new Date(), graduationDate: null, courses: ["Biology", "Chemistry", "Calculus"], address: {street: "123 Fake St.", city: "Bikini Bottom", zip: 12345}})
{
  acknowledged: true,
  insertedId: ObjectId("64c339ea2117327d42093f64")
}


11. To sort documents in alphabets wise ascending order.

school> db.students.find().sort({name:1})

12. To sort documents in alphabets wise descending order.

school> db.students.find().sort({name:-1})

13. To sort documents in gpa numbers in ascending order.

school> db.students.find().sort({gpa:1})
    
    gpa numbers in Descending order.

school> db.students.find().sort({gpa:-1})

14. school> db.students.find().limit(1) --> To limit get the documents from the collection.

15. To print the highest gpa document using sort and limit

school> db.students.find().sort({gpa:-1}).limit(1)
[
  {
    _id: ObjectId("64c29e9bda92fc120eddcfb4"),
    name: 'Sandy',
    age: 34,
    gpa: 4
  }
]

16. To print the lowest gpa document using sort and limit

school> db.students.find().sort({gpa:1}).limit(1)

17. To find the document using given query

school> db.students.find({name: "Gary"})
[
  {
    _id: ObjectId("64c29e9bda92fc120eddcfb5"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  }
]

school> db.students.find({gpa: 4.0})
[
  {
    _id: ObjectId("64c29e9bda92fc120eddcfb4"),
    name: 'Sandy',
    age: 34,
    gpa: 4
  }
]

school> db.students.find({fullTime: false})
[
  {
    _id: ObjectId("64c339ea2117327d42093f64"),
    name: 'Chinny',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    registerDate: ISODate("2023-07-28T03:45:46.820Z"),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 12345 }
  }
]

school> db.students.find({gpa: 4.0, fullTime: true})

18. To give the name of the each and every document of the students collection

db.students.find({query}, {projection})

school> db.students.find({}, {name:true})
[
  { _id: ObjectId("64c29d96da92fc120eddcfb2"), name: 'Spongebob' },
  { _id: ObjectId("64c29e9bda92fc120eddcfb3"), name: 'Patrick' },
  { _id: ObjectId("64c29e9bda92fc120eddcfb4"), name: 'Sandy' },
  { _id: ObjectId("64c29e9bda92fc120eddcfb5"), name: 'Gary' },
  { _id: ObjectId("64c338fe2117327d42093f63"), name: 'Larry' },
  { _id: ObjectId("64c339ea2117327d42093f64"), name: 'Chinny' }
]

school> db.students.find({}, {_id:false, name:true})
[
  { name: 'Spongebob' },
  { name: 'Patrick' },
  { name: 'Sandy' },
  { name: 'Gary' },
  { name: 'Larry' },
  { name: 'Chinny' }
]

school> db.students.find({}, {_id:false, name:true, gpa: true})
[
  { name: 'Spongebob', gpa: 3.2 },
  { name: 'Patrick', gpa: 1.8 },
  { name: 'Sandy', gpa: 4 },
  { name: 'Gary', gpa: 2.5 },
  { name: 'Larry' },
  { name: 'Chinny', gpa: 2.8 }
]

19. To update document using collection

school> db.students.updateOne({name: "Larry"}, {$set:{fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.find({name: "Larry"})
[
  {
    _id: ObjectId("64c338fe2117327d42093f63"),
    name: 'Larry',
    fullTime: true
  }
]

20. To update field in document using id field

school> db.students.updateOne({_id: ObjectId("64c29d96da92fc120eddcfb2")}, {$set:{fullTime:false}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.find({_id: ObjectId("64c29d96da92fc120eddcfb2")})
[
  {
    _id: ObjectId("64c29d96da92fc120eddcfb2"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  }
]

21. To remove the field using id field in document.

school> db.students.updateOne({_id: ObjectId("64c29d96da92fc120eddcfb2")}, {$unset:{fullTime:""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.find({_id: ObjectId("64c29d96da92fc120eddcfb2")})
[
  {
    _id: ObjectId("64c29d96da92fc120eddcfb2"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]

22. To update all documents in the collection.

school> db.students.updateMany({}, {$set: {fullTime:false}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 6,
  modifiedCount: 5,
  upsertedCount: 0
}
school> db.students.find()

23. To remove one field in the document using $unset 

school> db.students.updateOne({name:"Gary"}, {$unset:{fullTime:""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.find()

24. To update the field in the which not exists collection document.

school> db.students.updateMany({fullTime: {$exists:false}}, {$set:{fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
school> db.students.find()


db.students.updateOne({filter}, {update})


25. To delete the document using deleteOne method.

school> db.students.deleteOne({name: "Larry"})
{ acknowledged: true, deletedCount: 1 }
school> db.students.find()

26. To delete the documents using deleteMany method.

school> db.students.deleteMany({fullTime: false})
{ acknowledged: true, deletedCount: 4 }
school> db.students.find()
[
  {
    _id: ObjectId("64c29e9bda92fc120eddcfb5"),
    name: 'Gary',
    age: 20,
    gpa: 2.5,
    fullTime: true
  }
]

27. To delete the documents using exists attribute in the document field.

school> db.students.deleteMany({registerDate:{$exists:false}})
{ acknowledged: true, deletedCount: 1 }
school> db.students.find()

28. To retrieve the data except spongebob in the collections

school> db.students.find({name:{$ne:"Spongebob"}})
    less than age 
school> db.students.find({age:{$lt:20}})
    greater than age
school> db.students.find({age:{$gt:20}})

school> db.students.find({age:{$lte:20}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  }
]

school> db.students.find({age:{$gte:20}})

school> db.students.find({gpa:{$gte:3,$lte:4}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f67"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId("64c3525b2117327d42093f68"),
    name: 'Patrick',
    age: 38,
    gpa: 4
  }
]

$in - in - attribute

school> db.students.find({name:{$in:["Sandy","Patrick"]}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f68"),
    name: 'Patrick',
    age: 38,
    gpa: 4
  },
  {
    _id: ObjectId("64c3525b2117327d42093f69"),
    name: 'Sandy',
    age: 27,
    gpa: 2.2
  }
]

$nin - not in -- attribute

school> db.students.find({name:{$nin:["Sandy","Patrick"]}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  },
  {
    _id: ObjectId("64c3525b2117327d42093f66"),
    name: 'Larry',
    age: 24,
    gpa: 1.8
  },
  {
    _id: ObjectId("64c3525b2117327d42093f67"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]


Logical Query Operators
-----------------------
$and

$not

$nor

$or

school> db.students.find({$and: [{fullTime: true},{age:{$lte:23}}]})

school> db.students.find({$or: [{fullTime: true},{age:{$lte:22}}]})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  }
]

school> db.students.find({$or: [{fullTime: true},{age:{$lte:25}}]})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  },
  {
    _id: ObjectId("64c3525b2117327d42093f66"),
    name: 'Larry',
    age: 24,
    gpa: 1.8
  }
]

school> db.students.find({$nor: [{fullTime: true}, {age: {$lte:22}}]})

school> db.students.find({age:{$lt:30}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  },
  {
    _id: ObjectId("64c3525b2117327d42093f66"),
    name: 'Larry',
    age: 24,
    gpa: 1.8
  },
  {
    _id: ObjectId("64c3525b2117327d42093f69"),
    name: 'Sandy',
    age: 27,
    gpa: 2.2
  }
]
school> db.students.find({age:{$not:{$lt:30}}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f67"),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId("64c3525b2117327d42093f68"),
    name: 'Patrick',
    age: 38,
    gpa: 4
  }
]
school> db.students.find({age:{$not:{$gte:30}}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f65"),
    name: 'Gary',
    age: 20,
    gpa: 2.5
  },
  {
    _id: ObjectId("64c3525b2117327d42093f66"),
    name: 'Larry',
    age: 24,
    gpa: 1.8
  },
  {
    _id: ObjectId("64c3525b2117327d42093f69"),
    name: 'Sandy',
    age: 27,
    gpa: 2.2
  }
]


Indexes
-------

school> db.students.find({age:{$not:{$lt:30}}})
[
  {
    _id: ObjectId("64c3525b2117327d42093f67"),
    name: 'Spongebob',
  }
]

school> db.students.find({name:"Larry"}).explain("executionStats")
{
  explainVersion: '1',
  queryPlanner: {
    namespace: 'school.students',
    indexFilterSet: false,
    parsedQuery: { name: { '$eq': 'Larry' } },
    queryHash: '64908032',
    planCacheKey: '64908032',
    maxIndexedOrSolutionsReached: false,
    maxIndexedAndSolutionsReached: false,
    maxScansToExplodeReached: false,
    winningPlan: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Larry' } },
      direction: 'forward'
    },
    rejectedPlans: []
  },
  executionStats: {
    executionSuccess: true,
    nReturned: 1,
    executionTimeMillis: 5,
    totalKeysExamined: 0,
    totalDocsExamined: 5,
    executionStages: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Larry' } },
      nReturned: 1,
      executionTimeMillisEstimate: 0,
      works: 7,
      advanced: 1,
      needTime: 5,
      needYield: 0,
      saveState: 0,
      restoreState: 0,
      isEOF: 1,
      direction: 'forward',
      docsExamined: 5
    }
  },
  command: { find: 'students', filter: { name: 'Larry' }, '$db': 'school' },
  serverInfo: {
    host: 'chakravarthi',
    port: 27017,
    version: '6.0.5',
    gitVersion: 'c9a99c120371d4d4c52cbb15dac34a36ce8d3b1d'
  },
  serverParameters: {
    internalQueryFacetBufferSizeBytes: 104857600,
    internalQueryFacetMaxOutputDocSizeBytes: 104857600,
    internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
    internalDocumentSourceGroupMaxMemoryBytes: 104857600,
    internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
    internalQueryProhibitBlockingMergeOnMongoS: 0,
    internalQueryMaxAddToSetBytes: 104857600,
    internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600
  },
  ok: 1
}

school> db.students.createIndex({name:1})


school> db.students.getIndexes()
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { name: 1 }, name: 'name_1' }
]

school> db.students.dropIndex("name_1")
{ nIndexesWas: 2, ok: 1 }

school> db.students.getIndexes()
[ { v: 2, key: { _id: 1 }, name: '_id_' } ]



summary:
--------
school> show collections
students
school> db.createCollection("teachers", {capped:true, size: 10000000, max: 100},{autoIndexId:false})
{ ok: 1 }
school> show collections
students
teachers

school> show collections
students
school> db.createCollection("teachers", {capped:true, size: 10000000, max: 100},{autoIndexId:false})
{ ok: 1 }
school> show collections
students
teachers
school> db.createCollection("courses")
{ ok: 1 }
school> show collections
courses
students
teachers
school> db.courses.drop()
true
school> show collections
students
teachers


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





Update Operations in MongoDB

updateOne() and updateMany()
Removing and renaming fields
Adding, removing items from array
Updating embedded documents


updateOne() and updateMany()

syntax:
-------
db.<collection-name>.updateOne(
  { filter_condition },
  { $set: {existingField: newValue, newField: "New Value", // ...} }
)

db.<collection-name>.updateMany(
  { filter_condition },
  { $set: {existingField: newValue, // ...} }
)

Note:
-----
if you write field name which is not exists then it will be created.


// update the price value = 45 in a products collections, where the _id = ObjectId("64c2363be32f4a51b19b9271")

// update the isFeatures value = true in a products collections, where the name = Designer Handbag


Example 1:
---------
shop> db.products.updateOne({_id: ObjectId("64c2363be32f4a51b19b9271")}, {$set: {price: 45}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.products.find({_id: ObjectId("64c2363be32f4a51b19b9271")})
[
  {
    _id: ObjectId("64c2363be32f4a51b19b9271"),
    name: 'Pet Grooming Kit',
    company: '64c23350e32f4a51b19b923e',
    price: 45,
    colors: [ '#ffffff', '#ffcc00', '#99cc00' ],
    image: '/images/product-pet-grooming.png',
    category: '64c2342de32f4a51b19b9257',
    isFeatured: false
  }
]

Example 2:
----------
shop> db.products.updateOne({name:"Designer Handbag"},{$set:{isFeatured:false}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.products.find({name:"Designer Handbag"})
[
  {
    _id: ObjectId("64c23601e32f4a51b19b926c"),
    name: 'Designer Handbag',
    company: '64c23350e32f4a51b19b923a',
    price: 349,
    colors: [ '#000000', '#cc6600', '#663300' ],
    image: '/images/product-handbag.png',
    category: '64c2342de32f4a51b19b9250',
    isFeatured: false
  }
]

// updateMany
// update all the isFeatures value = true in a products collections, where the price = 120

Example 3:
----------
shop> db.products.updateMany({price:120},{$set:{'isFeatured':true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 5,
  modifiedCount: 5,
  upsertedCount: 0
}
shop> db.products.find({price:120},{name:1,isFeatured:1,_id:0})
[
  { name: 'Ergonomic Granite Sausages', isFeatured: true },
  { name: 'Unbranded Frozen Chicken', isFeatured: true },
  { name: 'Electronic Concrete Bacon', isFeatured: true },
  { name: 'Practical Concrete Ball', isFeatured: true },
  { name: 'Incredible Plastic Sausages', isFeatured: true }
]

// update the price = 154 and isFeatured = false fields from the products collections where the name = Unbranded Frozen Chicken.

Example:
--------
shop> db.products.updateMany({name:"Unbranded Frozen Chicken"},{$set:{price:154,isFeatured:false}})



Removing and Renaming Fields
----------------------------

syntax:
-------
db.<collection-name>.updateOne({filter_condition},{$unset:{fieldName:1}});


db.<collection-name>.updateOne({filter_condition},{$rename: {oldFieldName:"newFieldName"}});

// Renaming the products collection isFeatured field to isFeature, where the price = 123

Example :
---------
shop> db.products.updateMany({price:123},{$rename:{'isFeatured':'isFeature'}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 7,
  modifiedCount: 7,
  upsertedCount: 0
}
shop> db.products.find({price:123})
[
  {
    _id: ObjectId("64c23e543e180eb8a2682ff4"),
    name: 'Rustic Frozen Towels',
    company: ObjectId("64c23350e32f4a51b19b9235"),
    price: 123,
    colors: [ '#50215b' ],
    image: '/images/product-Rustic.png',
    category: ObjectId("64c2342de32f4a51b19b9255"),
    __v: 0,
    isFeature: false
  },
    {
    _id: ObjectId("64c23edf9dc1fb2f85601add"),
    name: 'Modern Frozen Soap',
    company: ObjectId("64c23350e32f4a51b19b9243"),
    price: 123,
    colors: [ '#2c042e' ],
    image: '/images/product-Gorgeous.png',
    category: ObjectId("64c2342de32f4a51b19b9258"),
    __v: 0,
    isFeature: false
  }
]


// Adding a new field in a document

db.<collection-name>.updateOne({filter_condition},{$set:{newField:"new value"}})


// Removing or Deleting the Field in a document
// To remove a field from documents in MongoDB, you can use the $unset update operator.

db.<collection-name>.updateOne({_id:ObjectId("123445")},{$unset:{fieldName:1}})

Example:
--------
shop> db.comments.find({_id:5}).limit(1)
[
  {
    _id: 5,
    title: 'Optimizing MongoDB Performance',
    content: 'Tips and tricks to improve MongoDB performance...',
    author: 'Alex Turner',
    comments: [
      { user: 'Ivy', text: 'Very practical advice!' },
      { user: 'Jack', text: 'Helped me a lot.' }
    ],
    metadata: { views: 900, likes: 55 },
    user: 'jessy'
  }
]
shop> db.comments.updateOne({_id:5}, {$unset:{"user":1}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


updating arrays and Embedded Documents
--------------------------------------

db.<collection-name>.updateOne(
  {filter_condition},
  {$push: {arrayField:"new element"}}
)


db.<collection-name>.updateOne(
  {filter_condition},
  {$pop: {arrayField:"new element"}}
)



db.<collection-name>.updateOne(
  {filter_condition},
  {$set: {"arrayField.$.text":"Updated text"}}
)


// How do you add a new element to an array using the $push operator?

db.<collection-name>.updateOne(
  {_id:Object("64b34893")},
  {$push: {arrayField:"new element"}}
);

Example:
--------
shop> db.comments.find({_id:5}).limit(1)
[
  {
    _id: 5,
    title: 'Optimizing MongoDB Performance',
    content: 'Tips and tricks to improve MongoDB performance...',
    author: 'Alex Turner',
    comments: [
      { user: 'Ivy', text: 'Very practical advice!' },
      { user: 'Jack', text: 'Helped me a lot.' }
    ],
    metadata: { views: 900, likes: 55 }
  }
]
shop> db.comments.updateOne({_id:5},{$push:{comments:{user:"Eva",text:"Like my channel"}}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.comments.find({_id:5}).limit(1)
[
  {
    _id: 5,
    title: 'Optimizing MongoDB Performance',
    content: 'Tips and tricks to improve MongoDB performance...',
    author: 'Alex Turner',
    comments: [
      { user: 'Ivy', text: 'Very practical advice!' },
      { user: 'Jack', text: 'Helped me a lot.' },
      { user: 'Eva', text: 'Like my channel' }
    ],
    metadata: { views: 900, likes: 55 }
  }
]


// Popping from an array : Removing the last element from an array in a document.

db.<collection-name>.updateOne(
  {_id: ObjectId("12345")},
  {$pop: {arrayField:1}}
);


Example:
--------
shop> db.comments.find({_id:5}).limit(1)
[
  {
    _id: 5,
    title: 'Optimizing MongoDB Performance',
    content: 'Tips and tricks to improve MongoDB performance...',
    author: 'Alex Turner',
    comments: [
      { user: 'Ivy', text: 'Very practical advice!' },
      { user: 'Jack', text: 'Helped me a lot.' },
      { user: 'Eva', text: 'Like my channel' }
    ],
    metadata: { views: 900, likes: 55 }
  }
]
shop> db.comments.updateOne({_id:5},{$pop:{comments:1}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.comments.find({_id:5}).limit(1)
[
  {
    _id: 5,
    title: 'Optimizing MongoDB Performance',
    content: 'Tips and tricks to improve MongoDB performance...',
    author: 'Alex Turner',
    comments: [
      { user: 'Ivy', text: 'Very practical advice!' },
      { user: 'Jack', text: 'Helped me a lot.' }
    ],
    metadata: { views: 900, likes: 55 }
  }
]



// updating a field within an embedded document.

// update the text value within an comments array = "Awesome article!", where the id=7&username=Alice.



shop> db.comments.find({_id:7,"comments.user":"Alice"})
[
  {
    _id: 7,
    title: 'Introduction to MongoDB',
    content: 'MongoDB is a popular NoSQL database...',
    author: 'Vinod Thapa',
    comments: [
      { user: 'Alice', text: 'Awesome article!' },
      { user: 'Vinod', text: 'Thanks for sharing.' }
    ],
    metadata: { views: 1000, likes: 70 }
  }
]
shop> db.comments.updateOne({_id:7,"comments.user":"Alice"},{$set:{"comments.$.text":"Awesome Programming Elements"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.comments.find({_id:7,"comments.user":"Alice"})
[
  {
    _id: 7,
    title: 'Introduction to MongoDB',
    content: 'MongoDB is a popular NoSQL database...',
    author: 'Vinod Thapa',
    comments: [
      { user: 'Alice', text: 'Awesome Programming Elements' },
      { user: 'Vinod', text: 'Thanks for sharing.' }
    ],
    metadata: { views: 1000, likes: 70 }
  }
]






Delete Operations in MongoDB

deleteOne()   deleteMany()

syntax:
-------

1. db.<collection-name>.deleteOne({filter_condition})


2. db.<collection-name>.deleteMany({price:55})


// In MongoDB, the Delete operations are used to remove documents from a collection. There are two main methods to perform deletion: 

deleteOne() and deleteMany().


// Delete a single Document:

1. db.<collection-name>.deleteOne({filter_condition})

Example :
----------

shop> db.comments.deleteOne({_id:1})
{ acknowledged: true, deletedCount: 1 }
shop> db.comments.find().count()
6
shop> db.comments.updateOne({_id:6},{$unset: {metadata:1}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
shop> db.comments.deleteOne({_id:6})
{ acknowledged: true, deletedCount: 1 }
shop> db.comments.find().count()
5


// Delete a Multiple Documents:

2. db.<collection-name>.deleteMany({price:55})

Example:
--------
shop> db.products.deleteMany({price:55})
{ acknowledged: true, deletedCount: 6 }
shop>
































Indexes in MongoDB
------------------

What are Indexes?
Indexes are specialized data structures that optimize data retrieval speed in MongoDB.

Indexes store a fraction of data in a more searchable format.

They enable MongoDB to locate data faster during queries.

Indexes are separate from collections and multiple indexes can exist per collection.

Benefits of Indexes
-------------------
Faster Querying: Indexes drastically accelerate data retrieval, particularly for large collections.

Efficient sorting: Indexes facilitate rapid sorting based on specific fields.

Improved Aggregation: Aggregation operations become more efficient with optimized indexes.

Indexing on Multiple Fields: Complex queries can be executed efficiently by utilizing multiple fields in indexes.

explain()
---------


Use explain() method to understand query execution in detail.

db.products.find({name: "Air Fryer"}).explain();


db.products.find({name: "Air Fryer"}).explain("executionStats");

Use it to measure the time taken to execute a query.

goto this website: https://jsonplaceholder.typicode.com/photos

cmd: mongoimport ./photos.json -d mern_stack -c photos --jsonArray


cmd: db.photos.find().count();

cmd: db.photos.find().explain();

cmd: db.photos.find({id:{$gt:45}}).count();

cmd: db.photos.find({id:{$gt:45}}).explain();

cmd: db.photos.find({id:{$gt:45}}).explain("executionStats");

Managing Indexes:
-----------------

db.collectionName.createIndex({fieldName: 1});
 
   (1) for storing indexes in ascending order
   (-1) for storing indexes in descending order

db.photos.createIndex({title: 1})
title_1

db.collecionName.getIndexes();
   _id is a default index.

db.photos.getIndexes();
[ { v: 2, key: { _id: 1 }, name: '_id_' } ]

mern_stack> db.photos.getIndexes();
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { title: 1 }, name: 'title_1' }
]

db.collectionName.dropIndex({field:1});

db.photos.dropIndex({title:1})
{ nIndexesWas: 2, ok: 1 }

db.collectionName.dropIndex("index_name");

db.photos.dropIndex("title_1");
{ nIndexesWas: 2, ok: 1 }

db.photos.find({title: 'sit asperiores est quos quis nisi veniam error'}).explain("executionStats")

db.photos.createIndex({title:1})
title_1

db.photos.find({title: 'sit asperiores est quos quis nisi veniam error'}).explain("executionStats")


// creating a unique index
db.collectionName.createIndex({fieldName:1},{unique:true})

// user registration form 
db.users.createIndex({email: 1},{unique: true})




Did not use indexes
-------------------

1. Do not use the rarely used fields

2. Do not use the Indexing in smaller collections

3. Indexing requires disk space and memory. overindexing can lead to resource strain and impact overall performance.




Aggregation:
------------
website url: https://gist.github.com/hiteshchoudhary/a80d86b50a5d9c591198a23d79e1e467



