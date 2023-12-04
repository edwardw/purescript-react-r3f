module React.Basic.R3F.Shapes
  ( boxGeometry
  , planeGeometry
  , torusKnotGeometry
  , mesh
  ) where

import React.Basic (JSX, ReactComponent, element)
import React.Basic.R3F.Internal (threejs)

boxGeometry
  :: forall props
   . { | props }
  -> JSX
boxGeometry = element boxGeometryImpl

planeGeometry
  :: forall props
   . { | props }
  -> JSX
planeGeometry = element planeGeometryImpl

torusKnotGeometry
  :: forall props
   . { | props }
  -> JSX
torusKnotGeometry = element torusKnotGeometryImpl

mesh
  :: forall props
   . { | props }
  -> JSX
mesh = element (threejs "Mesh")

foreign import boxGeometryImpl :: forall props. ReactComponent { | props }
foreign import planeGeometryImpl :: forall props. ReactComponent { | props }
foreign import torusKnotGeometryImpl :: forall props. ReactComponent { | props }

