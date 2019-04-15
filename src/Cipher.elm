module Cipher exposing (cipher, fromCaesar, toCaesar)

import Char exposing (fromCode, isUpper, toCode)
import String exposing (fromList, toList)


offset : Char -> Int
offset x =
    toCode <|
        if isUpper x then
            'A'

        else
            'a'


shift : Char -> Int
shift x =
    toCode x - offset x


cipher : Int -> Char -> Char
cipher n c =
    fromCode <| modBy 26 (shift c + n) + offset c


toCaesar : String -> String
toCaesar =
    fromList << List.map (cipher 3) << toList


fromCaesar : String -> String
fromCaesar =
    fromList << List.map (cipher -3) << toList
