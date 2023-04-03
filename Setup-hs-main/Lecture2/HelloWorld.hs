module Main where

-- namespacing Mystrings with Lib since it is inside the Lib/ folder
import Lib.MyStrings (greeting)

main :: IO ()
main = putStrLn greeting
