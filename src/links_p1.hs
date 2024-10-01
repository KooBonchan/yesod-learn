{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module Page1 where

import Yesod.Core
import Page2

getPage1R = defaultLayout [whamlet|<a href=@{Page2R}>P2|]