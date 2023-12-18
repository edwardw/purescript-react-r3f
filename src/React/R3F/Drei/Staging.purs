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

-- | A component that makes its contents float or hover.
float
  :: forall props
   . { | props }
  -> JSX
float = element floatImpl

foreign import stageImpl :: forall props. ReactComponent { | props }
foreign import skyImpl :: forall props. ReactComponent { | props }
foreign import floatImpl :: forall props. ReactComponent { | props }

