{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-}
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module LinksRoutes where

import Yesod

data Links = Links

mkYesod "Links" [parseRoutes|
/ HomeR GET
/page1 Page1R GET
/page2 Page2R GET
|]

instance Yesod Links
getHomeR = defaultLayout [whamlet|<a href=@{Page1R}>P1|]
getPage1R = defaultLayout [whamlet|<a href=@{Page2R}>P2|]
getPage2R = defaultLayout [whamlet|<a href=@{HomeR}>HOME|]