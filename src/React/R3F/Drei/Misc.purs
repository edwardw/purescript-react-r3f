module React.R3F.Drei.Misc where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import Untagged.Union (UndefinedOr)

-- | The position can be one of:
-- |    top-right | top-left | bottom-right | bottom-left
type PerfProps =
  ( logsPerSecond :: UndefinedOr Int
  , antialias :: UndefinedOr Boolean
  , overClock :: UndefinedOr Boolean
  , deepAnalyze :: UndefinedOr Boolean
  , showGraph :: UndefinedOr Boolean
  , minimal :: UndefinedOr Boolean
  , customData ::
      UndefinedOr
        { value :: Number
        , name :: String
        , round :: Int
        , info :: String
        }
  , matrixUpdate :: UndefinedOr Boolean
  , chart :: UndefinedOr { hz :: Int, length :: Int }
  , colorBlind :: UndefinedOr Boolean
  , className :: UndefinedOr String
  , position :: UndefinedOr String
  )

-- | A `three.js` performance meter.
perf
  :: forall props props_
   . Union props props_ PerfProps
  => { | props }
  -> JSX
perf = element perfImpl

foreign import perfImpl :: forall props. ReactComponent { | props }

