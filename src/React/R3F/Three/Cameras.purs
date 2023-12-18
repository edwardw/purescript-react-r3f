module React.R3F.Three.Cameras where

import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX)
import React.R3F.Three.Internal (elementWithArgs, threejs)

type OrthographicCameraArgs =
  ( left :: Number
  , right :: Number
  , top :: Number
  , bottom :: Number
  , near :: Number
  , far :: Number
  )

-- | A camera that uses orthographic projection.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/cameras/OrthographicCamera)
orthographicCamera
  :: forall args args_ props
   . Union args args_ OrthographicCameraArgs
  => { | args }
  -> { | props }
  -> JSX
orthographicCamera =
  elementWithArgs (threejs "OrthographicCamera") flattenOrthographicCameraArgs

foreign import flattenOrthographicCameraArgs :: forall args. { | args } -> Array Foreign

