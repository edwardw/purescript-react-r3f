module React.Basic.R3F.Lights
  ( ambientLight
  , directionalLight
  , directionalLightShadow
  ) where

import React.Basic (JSX, element)
import React.Basic.R3F.Three (threejs)

ambientLight
  :: forall props
   . Record props
  -> JSX
ambientLight = element (threejs "AmbientLight")

directionalLight
  :: forall props
   . Record props
  -> JSX
directionalLight = element (threejs "DirectionalLight")

directionalLightShadow
  :: forall props
   . Record props
  -> JSX
directionalLightShadow = element (threejs "DirectionalLightShadow")

