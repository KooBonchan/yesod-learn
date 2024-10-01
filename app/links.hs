{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

import Yesod.Core
import Page1
import Page2
import Home2

data Links = Links

mkYesod "Links" [parseRoutes|
/ Home2R GET
/page1 Page1R GET
/page2 Page2R GET
|]

main = warp 3000 Links
