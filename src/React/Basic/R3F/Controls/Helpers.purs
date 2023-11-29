module React.Basic.R3F.Controls.Helpers
  ( axesHelper
  , gridHelper
  , polarGridHelper
  , Args_gridHelper
  , Args_polarGridHelper
  ) where

import Prelude

import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)

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

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import gridHelperImpl
  :: forall args props. { | args } -> { | props } -> Effect JSX

foreign import polarGridHelperImpl
  :: forall args props. { | args } -> { | props } -> Effect JSX

