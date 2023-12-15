module React.R3F.Three.Lights where

import React.Basic (JSX, element)
import React.R3F.Three.Internal (threejs)

ambientLight
  :: forall props
   . { | props }
  -> JSX
ambientLight = element (threejs "AmbientLight")

directionalLight
  :: forall props
   . { | props }
  -> JSX
directionalLight = element (threejs "DirectionalLight")

