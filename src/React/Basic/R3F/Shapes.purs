module React.Basic.R3F.Shapes
  ( boxGeometry
  , planeGeometry
  , torusKnotGeometry
  ) where

import React.Basic (JSX, ReactComponent, element)

foreign import boxGeometry_ :: forall props. ReactComponent { | props }
foreign import planeGeometry_ :: forall props. ReactComponent { | props }
foreign import torusKnotGeometry_ :: forall props. ReactComponent { | props }

boxGeometry
  :: forall props
   . Record props
  -> JSX
boxGeometry = element boxGeometry_

planeGeometry
  :: forall props
   . Record props
  -> JSX
planeGeometry = element planeGeometry_

torusKnotGeometry
  :: forall props
   . Record props
  -> JSX
torusKnotGeometry = element torusKnotGeometry_

