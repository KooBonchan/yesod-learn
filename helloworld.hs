{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}


import Yesod.Core
data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|HelloWorld!|]

main :: IO()
main = warp 3000 HelloWorld