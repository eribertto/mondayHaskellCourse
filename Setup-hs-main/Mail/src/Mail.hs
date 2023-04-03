{-# LANGUAGE OverloadedStrings #-}

module Mail
    ( createMessage
    ) where

import qualified Data.ByteString.Char8 as BSC
import qualified Data.Text as T
import Mail.Hailgun

createMessage :: String -> String -> String -> Either HailgunErrorMessage HailgunMessage
createMessage subject body to = hailgunMessage
  (T.pack subject)
  (TextOnly $ BSC.pack body)
  "user@test.com"
  (MessageRecipients [BSC.pack to] [] [])
  []
