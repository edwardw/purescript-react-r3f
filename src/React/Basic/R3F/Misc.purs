module React.Basic.R3F.Misc (stats) where

import React.Basic (JSX, ReactComponent, element)

foreign import statsImpl :: forall props. ReactComponent { | props }

stats :: JSX
stats = element statsImpl {}

