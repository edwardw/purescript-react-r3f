module React.R3F.Web (canvas) where

import React.Basic (JSX, ReactComponent, element)

canvas
  :: forall props
   . { | props }
  -> JSX
canvas = element canvasImpl

foreign import canvasImpl :: forall props. ReactComponent { | props }

