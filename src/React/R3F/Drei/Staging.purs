module React.R3F.Drei.Staging where

import React.Basic (JSX, ReactComponent, element)

stage
  :: forall props
   . { | props }
  -> JSX
stage = element stageImpl

foreign import stageImpl :: forall props. ReactComponent { | props }

