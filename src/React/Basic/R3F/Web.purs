module React.Basic.R3F.Web (canvas) where

import React.Basic (JSX, ReactComponent, element)

foreign import canvas_ :: forall props. ReactComponent { | props }

canvas
  :: forall props
   . Record props
  -> JSX
canvas = element canvas_

