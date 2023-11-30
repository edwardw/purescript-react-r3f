module React.Basic.R3F.Controls.Helpers
  ( axesHelper
  , gridHelper
  , polarGridHelper
  , useCameraHelper
  , Args_gridHelper
  , Args_polarGridHelper
  , UseHelper
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Effect.Unsafe (unsafePerformEffect)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)
import React.Basic.Hooks (Hook, unsafeHook)

-- | A simple axis object to visualize the three axes.
-- | The x, y and z axes are red, green and blue, respectively.
axesHelper :: Number -> JSX
axesHelper size = element (threejs "AxesHelper") { args: [ size ] }

type Args_gridHelper =
  ( size :: Number
  , divisions :: Number
  , colorCenterLine :: String
  , colorGrid :: String
  )

-- | A two-dimensional grid.
gridHelper
  :: forall args args_ props
   . Union args args_ Args_gridHelper
  => { | args }
  -> { | props }
  -> JSX
gridHelper args = unsafePerformEffect <<< gridHelperImpl args

type Args_polarGridHelper =
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
   . Union args args_ Args_polarGridHelper
  => { | args }
  -> { | props }
  -> JSX
polarGridHelper args = unsafePerformEffect <<< polarGridHelperImpl args

-- | The camera helper visualizes the frustum of a camera.
useCameraHelper :: forall a b. { camera :: a } -> Hook (UseHelper b) Unit
useCameraHelper = unsafeHook <<< runEffectFn1 useCameraHelperImpl

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import data UseHelper :: Type -> Type -> Type

foreign import gridHelperImpl
  :: forall args props. { | args } -> { | props } -> Effect JSX

foreign import polarGridHelperImpl
  :: forall args props. { | args } -> { | props } -> Effect JSX

foreign import useCameraHelperImpl :: forall a. EffectFn1 { camera :: a } Unit

