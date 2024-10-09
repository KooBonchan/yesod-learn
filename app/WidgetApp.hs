{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

import Yesod

data WidgetApp = WidgetApp
mkYesod "WidgetApp" [parseRoutes|
/ HomeR GET
|]
instance Yesod WidgetApp

getHomeR = defaultLayout $ do
    setTitle "My Page Title"
    toWidget [lucius| h1 {color: green} |]
    addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"
    toWidget
        [julius|
            $(function(){
                $("h1").click(function(){
                    alert("You Clicked the Heading!");
                });
            });
        |]
    toWidgetHead
        [hamlet|
            <meta name=keysords content="Sample Keywords">
        |]
    toWidget
        [hamlet|
            <h1>toWidget hamlet quasiquotes
        |]
    [whamlet|<h2>whamlet for widget making|]
    toWidgetBody
        [julius|
            alert("Julius was Included IN THE BODY");
        |]

main = warp 3000 WidgetApp

