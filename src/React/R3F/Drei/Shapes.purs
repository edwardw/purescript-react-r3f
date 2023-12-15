module React.R3F.Drei.Shapes where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import React.R3F.Three.Geometries (BoxGeometryArgs, PlaneGeometryArgs, TorusKnotGeometryArgs, flattenBoxArgs, flattenPlaneArgs, flattenTorusKnotArgs)
import React.R3F.Three.Internal (elementWithArgs)

-- | Shortcut for a mesh with a box geometry.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/BoxGeometry)
box
  :: forall args args_ props
   . Union args args_ BoxGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
box = elementWithArgs boxImpl flattenBoxArgs

-- | Shortcut for a mesh with a plane geometry.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/PlaneGeometry)
plane
  :: forall args args_ props
   . Union args args_ PlaneGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
plane = elementWithArgs planeImpl flattenPlaneArgs

-- | Shortcut for a mesh with a torus knot geometry.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/geometries/TorusKnotGeometry)
torusKnot
  :: forall args args_ props
   . Union args args_ TorusKnotGeometryArgs
  => { | args }
  -> { | props }
  -> JSX
torusKnot = elementWithArgs torusKnotImpl flattenTorusKnotArgs

foreign import boxImpl :: forall props. ReactComponent { | props }
foreign import planeImpl :: forall props. ReactComponent { | props }
foreign import torusKnotImpl :: forall props. ReactComponent { | props }

