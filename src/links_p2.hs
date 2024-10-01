{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module Page2 where

import Yesod.Core
import Home2
getPage2R = defaultLayout [whamlet|<a href=@{Home2R}>HOME|]