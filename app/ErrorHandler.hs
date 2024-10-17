{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE QuasiQuotes        #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# LANGUAGE TypeFamilies       #-}
module ErrorHandler where
import Yesod

data ErrorHandler = ErrorHandler

mkYesod "ErrorHandler" [parseRoutes|
/ HomeR GET
/error ErrorR GET
/not-found NotFoundR GET
|]

instance Yesod ErrorHandler where
    errorHandler NotFound = fmap toTypedContent $ defaultLayout $ do
        setTitle "Request page not located"
        toWidget [hamlet|
            <h1>404 Not Found
            <p>We appologize|]
    errorHandler other = defaultErrorHandler other

getHomeR = defaultLayout 
    [whamlet|
        <p>
            <a href=@{ErrorR}>Internal Server Error
            <a href=@{NotFoundR}>Not Found
    |]

getErrorR :: Handler ()
getErrorR = error "This is an error"
getNotFoundR :: Handler ()
getNotFoundR = notFound

main :: IO ()
main = warp 3000 ErrorHandler