db.products.aggregate([
    {
        $lookup: {
            from: "categories",
            localField: "category",
            foreignField: "_id",
            as: "category_info"
        }
    },
    {
        $addFields: {
            category_info: {
                $arrayElemAt: ["$category_info", 0]
            }
        }
    },
    {
        $project: {
            product_name: 1,
            brand: 1,
            _id: 0,
            "category_info.name": 1
        }
    }
])