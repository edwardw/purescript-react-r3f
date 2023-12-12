module React.R3F.Drei.Misc where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)

-- | The position can be one of:
-- |    top-right | top-left | bottom-right | bottom-left
type PerfProps =
  ( logsPerSecond :: Int
  , antialias :: Boolean
  , overClock :: Boolean
  , deepAnalyze :: Boolean
  , showGraph :: Boolean
  , minimal :: Boolean
  , customData ::
      { value :: Number
      , name :: String
      , round :: Int
      , info :: String
      }
  , matrixUpdate :: Boolean
  , chart :: { hz :: Int, length :: Int }
  , colorBlind :: Boolean
  , className :: String
  , position :: String
  )

-- | A `three.js` performance meter.
perf
  :: forall props props_
   . Union props props_ PerfProps
  => { | props }
  -> JSX
perf = element perfImpl

foreign import perfImpl :: forall props. ReactComponent { | props }

