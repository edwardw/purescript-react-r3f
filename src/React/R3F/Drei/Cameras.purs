module React.R3F.Drei.Cameras where

import React.Basic (JSX, ReactComponent, element)

perspectiveCamera
  :: forall props
   . { | props }
  -> JSX
perspectiveCamera = element perspectiveCameraImpl

orthographicCamera
  :: forall props
   . { | props }
  -> JSX
orthographicCamera = element perspectiveCameraImpl

foreign import orthographicCameraImpl :: forall props. ReactComponent { | props }
foreign import perspectiveCameraImpl :: forall props. ReactComponent { | props }

