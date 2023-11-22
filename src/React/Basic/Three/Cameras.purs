module React.Basic.Three.Cameras
  ( orthographicCamera
  , perspectiveCamera
  ) where

import React.Basic (JSX, ReactComponent, element)

foreign import orthographicCamera_ :: forall props. ReactComponent { | props }
foreign import perspectiveCamera_ :: forall props. ReactComponent { | props }

perspectiveCamera
  :: forall props
   . Record props
  -> JSX
perspectiveCamera = element perspectiveCamera_

orthographicCamera
  :: forall props
   . Record props
  -> JSX
orthographicCamera = element perspectiveCamera_

