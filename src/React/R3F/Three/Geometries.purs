module React.R3F.Three.Geometries where

import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX)
import React.R3F.Three.Internal (elementWithArgs, threejs)

type BoxGeometryArgs =
  ( width :: Number
  , height :: Number
  , depth :: Number
  , widthSegments :: Int
  , heightSegments :: Int
  , depthSegments :: Int
  )

-- | A geometry for a rectangular cuboid with given width, height and depth.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/BoxGeometry)
boxGeometry
  :: forall args args_ props
   . Union args args_ BoxGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
boxGeometry = elementWithArgs (threejs "BoxGeometry") flattenBoxArgs

type PlaneGeometryArgs =
  ( width :: Number
  , height :: Number
  , widthSegments :: Int
  , heightSegments :: Int
  )

-- | A 2-dimensional plane geometry.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/PlaneGeometry)
planeGeometry
  :: forall args args_ props
   . Union args args_ PlaneGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
planeGeometry = elementWithArgs (threejs "PlaneGeometry") flattenPlaneArgs

type TorusKnotGeometryArgs =
  ( radius :: Number
  , tube :: Number
  , tubularSegments :: Int
  , radialSegments :: Int
  , p :: Int
  , q :: Int
  )

-- | A torus knot.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/TorusKnotGeometry)
torusKnotGeometry
  :: forall args args_ props
   . Union args args_ TorusKnotGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
torusKnotGeometry = elementWithArgs (threejs "TorusKnotGeometry") flattenTorusKnotArgs

type SphereGeometryArgs =
  ( radius :: Number
  , widthSegments :: Int
  , heightSegments :: Int
  , phiStart :: Number
  , phiLength :: Number
  , thetaStart :: Number
  , thetaLength :: Number
  )

-- | A sphere.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/SphereGeometry)
sphereGeometry
  :: forall args args_ props
   . Union args args_ SphereGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
sphereGeometry = elementWithArgs (threejs "SphereGeometry") flattenSphereArgs

type CircleGeometryArgs =
  ( radius :: Number
  , segments :: Int
  , thetaStart :: Number
  , thetaLength :: Number
  )

-- | A circle or part of a circle.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/CircleGeometry)
circleGeometry
  :: forall args args_ props
   . Union args args_ CircleGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
circleGeometry = elementWithArgs (threejs "CircleGeometry") flattenCircleArgs

foreign import flattenBoxArgs :: forall args. { | args } -> Array Foreign
foreign import flattenPlaneArgs :: forall args. { | args } -> Array Foreign
foreign import flattenTorusKnotArgs :: forall args. { | args } -> Array Foreign
foreign import flattenSphereArgs :: forall args. { | args } -> Array Foreign
foreign import flattenCircleArgs :: forall args. { | args } -> Array Foreign

