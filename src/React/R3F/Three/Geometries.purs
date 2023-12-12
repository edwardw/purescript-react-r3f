module React.R3F.Three.Geometries where

import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX)
import React.R3F.Three.Core (BufferGeometryProps)
import React.R3F.Three.Internal (elementWithArgs, threejs)

type BoxGeometryArgs =
  ( width :: Number
  , height :: Number
  , depth :: Number
  , widthSegments :: Int
  , heightSegments :: Int
  , depthSegments :: Int
  )

boxGeometry
  :: forall args args_ props props_ a
   . Union args args_ BoxGeometryArgs
  => Union props props_ (BufferGeometryProps a)
  => { | args }
  -> { | props }
  -> JSX
boxGeometry = elementWithArgs (threejs "BoxGeometry") flattenBoxArgs

foreign import flattenBoxArgs :: forall args. { | args } -> Array Foreign

