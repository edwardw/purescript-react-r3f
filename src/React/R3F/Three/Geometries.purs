module React.R3F.Three.Geometries where

import Foreign (Foreign)
import React.Basic (JSX)
import React.R3F.Three.Internal (elementWithArgs, threejs)

boxGeometry
  :: forall args props
   . { | args }
  -> { | props }
  -> JSX
boxGeometry = elementWithArgs (threejs "BoxGeometry") flattenBoxArgs

foreign import flattenBoxArgs :: forall args. { | args } -> Array Foreign

