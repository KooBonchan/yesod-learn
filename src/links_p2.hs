{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module Page2R where

import Yesod.Core
getPage2R = defaultLayout [whamlet|<a href=@{HomeR}>HOME|]