module React.R3F.Three.Lights where

import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX, element)
import React.R3F.Three.Internal (elementWithArgs, threejs)

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

type SpotLightArgs =
  ( color :: Int
  , intensity :: Number
  , distance :: Number
  , angle :: Number
  , penumbra :: Number
  , decay :: Number
  )

-- | A spot light that gets emitted from a single point in one direction, along
-- | a cone that increases in size the further away from the light.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/lights/SpotLight)
spotLight
  :: forall args args_ props
   . Union args args_ SpotLightArgs
  => { | args }
  -> { | props }
  -> JSX
spotLight = elementWithArgs (threejs "SpotLight") flattenSpotLightArgs

foreign import flattenSpotLightArgs :: forall args. { | args } -> Array Foreign

