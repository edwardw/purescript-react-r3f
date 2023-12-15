module React.R3F.Three.Helpers
  ( axesHelper
  , gridHelper
  , polarGridHelper
  , useCameraHelper
  , UseHelper
  ) where

import Prelude

import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX, element)
import React.Basic.Hooks (Hook, unsafeHook)
import React.R3F.Three.Internal (elementWithArgs, threejs)

-- | A simple axis object to visualize the three axes.
-- | The x, y and z axes are red, green and blue, respectively.
axesHelper :: Number -> JSX
axesHelper size = element (threejs "AxesHelper") { args: [ size ] }

type GridHelperArgs =
  ( size :: Number
  , divisions :: Number
  , colorCenterLine :: String
  , colorGrid :: String
  )

-- | A two-dimensional grid.
gridHelper
  :: forall args args_ props
   . Union args args_ GridHelperArgs
  => { | args }
  -> { | props }
  -> JSX
gridHelper = elementWithArgs (threejs "GridHelper") flattenGridHelperArgs

type PolarGridHelperArgs =
  ( radius :: Number
  , sectors :: Number
  , rings :: Number
  , divisions :: Number
  , color1 :: String
  , color2 :: String
  )

-- | A two-dimensional polar grid.
polarGridHelper
  :: forall args args_ props
   . Union args args_ PolarGridHelperArgs
  => { | args }
  -> { | props }
  -> JSX
polarGridHelper = elementWithArgs (threejs "PolarGridHelper") flattenPolarHelperArgs

foreign import data UseHelper :: Type -> Type -> Type

-- | The camera helper visualizes the frustum of a camera.
-- |
-- | It usually makes little sense to attach a camera helper to the canvas
-- | default camera. By definition, the default camera's frustum defines what
-- | users see in the screen, i.e. it is fixed. So does the camera helper
-- | attached to it, which won't be too interesting.
useCameraHelper :: forall a b. a -> Hook (UseHelper b) Unit
useCameraHelper = unsafeHook <<< runEffectFn1 useCameraHelperImpl

foreign import flattenGridHelperArgs :: forall args. { | args } -> Array Foreign
foreign import flattenPolarHelperArgs :: forall args. { | args } -> Array Foreign
foreign import useCameraHelperImpl :: forall a. EffectFn1 a Unit

