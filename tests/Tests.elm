module Tests exposing (all)

import Cipher exposing (cipher, fromCaesar, toCaesar)
import Expect exposing (equal)
import Test exposing (Test, describe, test)


str : String
str =
    "flavio"


all : Test
all =
    describe "Cipher tests!"
        [ test "cipher" <| \_ -> equal (cipher 3 'a') 'd'
        , test "toCaesar" <| \_ -> equal (toCaesar str) "iodylr"
        , test "fromCaesar" <| \_ -> equal (fromCaesar "iodylr") str
        , test "encrypt <-> decrypt" <| \_ -> equal str (fromCaesar <| toCaesar <| str)
        ]
