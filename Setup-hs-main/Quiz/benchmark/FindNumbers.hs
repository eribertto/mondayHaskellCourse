module Main where

import Control.Monad (mapM, replicateM)
import Criterion
import Criterion.Main (defaultMain)
import Data.Maybe (mapMaybe)
import qualified Data.Map as M
import System.Random (randomRIO)
import System.Random.Shuffle (shuffleM)

main :: IO ()
main = do
  [(d1, k1), (d2, k2), (d3, k3), (d4, k4)] <- mapM generateInputs [10, 100, 1000, 10000]
  defaultMain
    [ bgroup "Find Numbers Benchmark"
      [ bench "Size 10 Test" $ nf (findNumbers d1) k1
      , bench "Size 100 Test" $ nf (findNumbers d2) k2
      , bench "Size 1000 Test" $ nf (findNumbers d3) k3
      , bench "Size 10000 Test" $ nf (findNumbers d4) k4
      ]
    ]

-- Given a list of Int-Int pairs, and a list of keys,
-- return the values associated with the keys in order.
findNumbers :: [(Int, Int)] -> [Int] -> [Int]
findNumbers = findNumbersMap

findNumbersList :: [(Int, Int)] -> [Int] -> [Int]
findNumbersList dictionary = mapMaybe (`lookup` dictionary)

findNumbersMap :: [(Int, Int)] -> [Int] -> [Int]
findNumbersMap dictionary = mapMaybe (`M.lookup` dictionary')
  where
    dictionary' = M.fromList dictionary

generateInputs :: Int -> IO ([(Int, Int)], [Int])
generateInputs n = do
  let keys = [1..n]
  shuffledKeys <- shuffleM keys
  vals <- replicateM n (randomRIO (1, 10000 :: Int))
  return (zip keys vals, shuffledKeys)
