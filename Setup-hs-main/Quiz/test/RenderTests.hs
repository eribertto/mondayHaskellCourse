module Main where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (testCase, (@?=))

import Questions

main :: IO ()
main = defaultMain renderTests

renderTests :: TestTree
renderTests = testGroup "Render Tests"
  [ testCase "Question 1 Length" $ length renderQ1 @?= 5
  , testCase "Question 1-1" $ renderQ1 !! 0 @?= "What does the 'partition' function do?"
  , testCase "Question 1-2" $ renderQ1 !! 1 @?= "Returns the subset of elements in the input list satisfying the predicate"
  ]
  where
    renderQ1 = renderQuestion question1
