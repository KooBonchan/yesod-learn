{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

import Control.Exception (IOException, try)
import Control.Monad     (when)
import Yesod

data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
|]

instance Yesod App where
    -- shouldLogIO : message logging
    shouldLogIO App src level = 
        return True

getHomeR = do
    $logDebug "Trying to read data file"
    edata <- liftIO $ try $ readFile "datafile.txt"
    case edata :: Either IOException String of
        Left e -> do
            $logError "Could not read datafile.txt"
            defaultLayout [whamlet|an error occurred|]
        Right str -> do
            $logInfo "Reading datafile success"
            let ls = lines str
            when (length ls < 5) $ $logWarn "less than 5 lines"
            defaultLayout
                [whamlet|
                    <ul>
                        $forall l <- ls
                            <li>#{l}
                |]

main :: IO ()
main = warp 3000 App