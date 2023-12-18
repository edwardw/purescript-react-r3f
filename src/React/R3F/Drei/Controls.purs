module React.R3F.Drei.Controls where

import Prelude

import Effect (Effect)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)

-- | Orbit controls allow the camera to orbit around a target.
orbitControls
  :: forall props
   . { | props }
  -> JSX
orbitControls = element orbitControlsImpl

type CameraControlsProps =
  ( camera :: JSX
  , makeDefault :: Boolean
  , onStart :: { "type" :: String } -> Effect Unit
  , onEnd :: { "type" :: String } -> Effect Unit
  , onChange :: { "type" :: String } -> Effect Unit
  )

-- | Camera controls, similar to orbit controls but support smooth transition
-- | and more features.
cameraControls
  :: forall props props_
   . Union props props_ CameraControlsProps
  => { | props }
  -> JSX
cameraControls = element cameraControlsImpl

foreign import orbitControlsImpl :: forall props. ReactComponent { | props }
foreign import cameraControlsImpl :: forall props. ReactComponent { | props }

