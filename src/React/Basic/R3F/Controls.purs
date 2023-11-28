module React.Basic.R3F.Controls
  ( orbitControls
  ) where

import React.Basic (JSX, ReactComponent, element)

foreign import orbitControlsImpl :: forall props. ReactComponent { | props }

orbitControls
  :: forall props
   . Record props
  -> JSX
orbitControls = element orbitControlsImpl

