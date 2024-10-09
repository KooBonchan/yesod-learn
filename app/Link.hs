{-# Language OverloadedStrings #-}
{-# Language QuasiQuotes       #-} 
{-# Language TemplateHaskell   #-}
{-# Language TypeFamilies      #-}

module Link where

import Yesod

import LinksRoutes


main = warp 3000 Links
