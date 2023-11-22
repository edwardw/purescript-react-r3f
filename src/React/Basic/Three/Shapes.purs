module React.Basic.Three.Shapes
  ( boxGeometry
  , planeGeometry
  ) where

import React.Basic (JSX, ReactComponent, element)

foreign import boxGeometry_ :: forall props. ReactComponent { | props }
foreign import planeGeometry_ :: forall props. ReactComponent { | props }

boxGeometry
  :: forall props
   . Record props
  -> JSX
boxGeometry = element boxGeometry_

planeGeometry
  :: forall props
   . Record props
  -> JSX
planeGeometry = element boxGeometry_

