module React.R3F.Drei.Shapes where

import React.Basic (JSX, ReactComponent, element)

-- | Shortcut for a mesh with a box geometry.
box
  :: forall props
   . { | props }
  -> JSX
box = element boxImpl

-- | Shortcut for a mesh with a plane geometry.
plane
  :: forall props
   . { | props }
  -> JSX
plane = element planeImpl

-- | A shortcut for a mesh with a torus knot geometry.
torusKnot
  :: forall props
   . { | props }
  -> JSX
torusKnot = element torusKnotImpl

foreign import boxImpl :: forall props. ReactComponent { | props }
foreign import planeImpl :: forall props. ReactComponent { | props }
foreign import torusKnotImpl :: forall props. ReactComponent { | props }

