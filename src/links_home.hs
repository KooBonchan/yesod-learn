{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module Home2 where

import Yesod.Core
import Page1

instance Yesod Links

getHome2R defaultLayout [whamlet|<a href=@{Page1R}>P1|]