module Main where

import Prelude

import Effect (Effect)
import Effect.Console
import Data.Array
import Data.Maybe
import JS.Argv (argv)
import Cmd.Init (init)
import Cmd.Help (help)

main :: Effect Unit
main = do
  case (args !! 0) of
       Just "init" -> do 
          case (args !! 1) of
               Just _ -> init $ fromMaybe "" $ args !! 1
               Nothing -> init "." 
       Just _ -> help 
       Nothing -> help
  where
        args = drop 2 argv
