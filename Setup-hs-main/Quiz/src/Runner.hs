module Runner
    ( runQuiz
    ) where

import Text.Read (readMaybe)

import Questions (allQuestions, Question(..), renderQuestion)

runQuiz :: IO ()
runQuiz = runQuestions allQuestions (0, 0)

runQuestions :: [Question] -> (Int, Int) -> IO ()
runQuestions [] (correct, total) = do
  putStrLn "You have finished all the questions!"
  putStrLn $ "You got " <> show correct <> " questions correct out of " <> show total
runQuestions (q : qs) (prevCorrect, total) = do
  newCorrect <- runQuestion q (total + 1)
  runQuestions qs (prevCorrect + if newCorrect then 1 else 0, total + 1)

runQuestion :: Question -> Int -> IO Bool
runQuestion q@(Question _ _ _ _ _ correct) questionNum = do
  putStrLn $ "Question: " <> show questionNum
  let questionLines = renderQuestion q
  mapM_ putStrLn questionLines
  answer <- parseInt readMaybe
  if answer == correct
    then putStrLn "Correct!\n"  >> return True
    else putStrLn ("Inrorrect! The correct answer was " <> show correct <> "\n")  >> return False

parseInt :: (String -> Maybe Int) -> IO Int
parseInt parser = do
  input <- getLine
  case parser input of
    Nothing -> putStrLn "I couldn't read an integer (1-4) from that! Try again!" >> parseInt parser
    Just i -> return i
