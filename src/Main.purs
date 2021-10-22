module Main where

import Prelude

import Effect (Effect)
import Effect.Console
import Data.Array
import Data.Maybe
import JS.Argv (argv)
import Cmd.Init (init)

main :: Effect Unit
main = do
  case (args !! 0) of
       Just "init" -> init
       Just (_) -> log "1"
       Nothing -> log "0"
  where
        args = drop 2 argv
