-- | Miscellaneous components and types
module React.Basic.R3F.Misc
  ( stats
  , group
  , Null
  , null
  ) where

import React.Basic (JSX, ReactComponent, element)
import React.Basic.R3F.Internal (threejs)

stats :: JSX
stats = element statsImpl {}

group
  :: forall props
   . { | props }
  -> JSX
group = element (threejs "Group")

foreign import statsImpl :: forall props. ReactComponent { | props }

-- purescript-literals has it, but seems to have bundling errors.
foreign import data Null :: Type
foreign import nullImpl :: Null

-- | The js null value
-- |
-- | In three.js, to "un-set" a property of some object often is to set it to
-- | null.
null :: Null
null = nullImpl

