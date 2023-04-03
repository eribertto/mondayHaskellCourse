module Questions where

data Question = Question
  { prompt :: String
  , answer1 :: String
  , answer2 :: String
  , answer3 :: String
  , answer4 :: String
  , correctAnswer :: Int
  }

renderQuestion :: Question -> [String]
renderQuestion (Question p a b c d _) =
  [ p
  , "1: " <> a
  , "2: " <> b
  , "3: " <> c
  , "4: " <> d
  ]

allQuestions :: [Question]
allQuestions =
  [ question1
  , question2
  , question3
  , question4
  ]

question1 :: Question
question1 = Question
  "What does the 'partition' function do?"
  "Returns the subset of elements in the input list satisfying the predicate"
  "Takes a predicate and a list, and returns the pair of lists which do and do not satisfy the predicate, respectively"
  "Return a tuple of lists where the first list is the longest prefix of the input list satisfying the predicate"
  "Drops the largest suffix of a list in which the given predicate holds for all elements"
  2

question2 :: Question
question2 = Question
  "What is the result of the expression `span (<3) [1, 2, 3, 5, 2, 1, 6, 0]`?"
  "([1, 2])"
  "([1, 2, 2, 1, 0])"
  "([1, 2], [3, 5, 2, 1, 6, 0])"
  "([1, 2, 2, 1, 0], [3, 5, 6])"
  3

question3 :: Question
question3 = Question
  "What is the result of the expression `delete 1 [2, 5, 1, 0, 1, 2, 1]`"
  "[2, 5, 0, 1, 2, 1]"
  "[2, 0, 5, 2]"
  "[2, 1, 0, 1, 2, 1]"
  "[5, 1, 0, 1, 2, 1]"
  1

question4 :: Question
question4 = Question
  "What is the type signature for `sortOn`?"
  "(a -> a -> Bool) -> [a] -> [a]"
  "Ord a => [a] -> [a]"
  "(a -> a -> Ordering) -> [a] -> [a]"
  "Ord b => (a -> b) -> [a] -> [a]"
  4
