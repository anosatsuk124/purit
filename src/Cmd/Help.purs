module Cmd.Help where

import Prelude

import Effect (Effect)
import Effect.Console (log)

help :: Effect Unit
help = do 
    log "Purit - A git implementation in Purescript - (c) 2021 Viterum (Satsuki Akiba)"
    log "\n help:"
    log "\t init - Initialize your repository."
    log "\t help - Show the help menu"
