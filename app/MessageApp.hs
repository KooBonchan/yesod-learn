{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

module MessageApp where

import Yesod
import Data.Time (getCurrentTime)

data MessageApp = MessageApp

mkYesod "MessageApp" [parseRoutes|
/ HomeR GET
|]

instance Yesod MessageApp where
    defaultLayout contents = do
        PageContent title _ headTags bodyTags <- widgetToPageContent contents
        mmsg <- getMessage
        withUrlRenderer [hamlet|
            $doctype 5

            <html>
                <head>
                    <title>#{title}
                    ^{headTags}
                <body>
                    $maybe msg <- mmsg
                        <div #message>#{msg}
                    ^{bodyTags}
        |]

getHomeR = do
    now <- liftIO getCurrentTime
    setMessage $ toHtml $ "Last time visited: " ++ show now
    defaultLayout [whamlet|<p>Try refreshing|]

main = warp 3000 MessageApp