module Cmd.Init where

import Effect.Console
import Prelude

import Data.Unit (Unit)
import Effect (Effect)
import Effect.Exception (throwException)
import Effect.Unsafe (unsafePerformEffect)
import Node.FS.Sync as FS
import Node.Encoding as NE


init :: Effect Unit
init = do
    if unsafePerformEffect (FS.exists(gitdir))
      then log "The git repository already exists."
    else do
      FS.mkdir gitdir
      FS.mkdir $ gitdir <> "branches"
      FS.mkdir $ gitdir <> "objects"
      FS.mkdir $ gitdir <> "refs"
      FS.mkdir $ gitdir <> "refs/" <> "tags"
      FS.mkdir $ gitdir <> "refs/" <> "heads"
      FS.writeTextFile NE.UTF8 (gitdir <> "HEAD") "ref: refs/heads/master\n"
      FS.writeTextFile NE.UTF8 (gitdir <> "description") "Unnamed repository; edit this file 'description' to name the repository.\n"
      FS.writeTextFile NE.UTF8 (gitdir <> "config") "[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\tbare = false\n\tlogallrefupdates = true"
    where
          gitdir = ".git/"
