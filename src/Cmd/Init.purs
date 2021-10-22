module Cmd.Init where

import Effect.Console
import Prelude

import Data.Unit (Unit)
import Effect (Effect)
import Effect.Exception (throwException)
import Effect.Unsafe (unsafePerformEffect)
import Node.FS.Sync as FS
import Node.Encoding as NE


init :: String -> Effect Unit
init args = do 
      case ( args ) of
         _ -> FS.mkdir args
         "." -> pure unit
      if args == "." && unsafePerformEffect (FS.exists(gitdir))
        then log "The git repository already exists."
      else do
        FS.mkdir $ args <> "/" <> gitdir
        FS.mkdir $ args <> "/" <> gitdir <> "branches"
        FS.mkdir $ args <> "/" <> gitdir <> "objects"
        FS.mkdir $ args <> "/" <> gitdir <> "refs"
        FS.mkdir $ args <> "/" <> gitdir <> "refs/" <> "tags"
        FS.mkdir $ args <> "/" <> gitdir <> "refs/" <> "heads"
        FS.writeTextFile NE.UTF8 (args <> "/" <> gitdir <> "HEAD") "ref: refs/heads/master\n"
        FS.writeTextFile NE.UTF8 (args <> "/" <> gitdir <> "description") "Unnamed repository; edit this file 'description' to name the repository.\n"
        FS.writeTextFile NE.UTF8 (gitdir <> "config") "[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\tbare = false\n\tlogallrefupdates = true"
   where
      gitdir = ".git/"
