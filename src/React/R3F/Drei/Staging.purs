module React.R3F.Drei.Staging where

import React.Basic (JSX, ReactComponent, element)

stage
  :: forall props
   . { | props }
  -> JSX
stage = element stageImpl

sky
  :: forall props
   . { | props }
  -> JSX
sky = element skyImpl

foreign import stageImpl :: forall props. ReactComponent { | props }
foreign import skyImpl :: forall props. ReactComponent { | props }

