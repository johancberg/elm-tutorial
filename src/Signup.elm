module Signup exposing (User)

type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }