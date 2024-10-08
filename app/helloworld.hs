{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

-- Fix from Yesod to Yesod.Core --> no more Yesod direct library maybe?
-- import Yesod.Core
-- Package.yaml only imported Yesod-Core not Yesod
-- which occurred stack not able to compile
module HelloWorld where
import Yesod


data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|HelloWorld!|]

main :: IO()
main = warp 3000 HelloWorld