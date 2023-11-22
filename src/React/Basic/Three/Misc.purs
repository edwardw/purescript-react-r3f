module React.Basic.Three.Misc (stats) where

import React.Basic (JSX, ReactComponent, element)

foreign import stats_ :: forall props. ReactComponent { | props }

stats
  :: forall props
   . Record props
  -> JSX
stats = element stats_

