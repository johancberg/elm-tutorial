module Data exposing (..)

import Dict exposing (Dict)

-- Task from Albert 23-05-10
-- Dict might not be neccesary in this task as we don't check the keys. Use List instead.
-- Set could be prefferable than list in some (not all cases) as it divide and conquer search of elements.


type alias Data =
    { products : Dict String Product
    , categories : Dict String Category
    }


type alias Product =
    { id : String
    , name : String
    , price : Int
    , categories : List PositionInCategory
    }


type alias PositionInCategory =
    { position : Int
    , categoryId : String
    }


type alias Category =
    { id : String
    , name : String
    , parentId : String
    }


products : Dict String Product
products =
    Dict.fromList
    [ ( "1", { id = "1", name = "clothes", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "2", { id = "2", name = "pants", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "3", { id = "3", name = "jeans", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "4", { id = "4", name = "chinos", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "5", { id = "5", name = "shorts", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "6", { id = "6", name = "skirts", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    , ( "7", { id = "7", name = "shirts", price = 0, categories = [{ position = 0, categoryId = "0" }] })
    ]


categories : Dict String Category
categories =
    Dict.fromList
    [ ( "1", { id = "1", name = "clothes", parentId = "" })
    , ( "2", { id = "2", name = "pants", parentId = "1" })
    , ( "3", { id = "3", name = "jeans", parentId = "1" })
    , ( "4", { id = "4", name = "chinos", parentId = "2" })
    , ( "5", { id = "5", name = "shorts", parentId = "2" })
    , ( "6", { id = "6", name = "skirts", parentId = "2" })
    , ( "7", { id = "7", name = "shirts", parentId = "1" })
    ]


productsInCategory : Data -> String -> List Product
productsInCategory data id =
    List.map checkCategory ((Dict.values data.categories) id)


checkCategory : Category -> String -> List Category
checkCategory category id =
    if category.parentId == id then
        [category]

    else
        []
    
