module Main where

-- namespacing Mystrings with Lib since the Library.hs is inside Lib/ folder
import Lib.MyStrings (greeting)

main :: IO ()
main = putStrLn greeting
