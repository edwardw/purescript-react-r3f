module React.Basic.Three.Cameras (perspectiveCamera) where

import React.Basic (JSX, ReactComponent, element)

foreign import perspectiveCamera_ :: forall props. ReactComponent { | props }

perspectiveCamera
  :: forall props
   . Record props
  -> JSX
perspectiveCamera = element perspectiveCamera_

