module React.Basic.R3F.Materials
  ( meshLambertMaterial
  , meshPhongMaterial
  , meshStandardMaterial
  , meshNormalMaterial
  ) where

import React.Basic (JSX, element)
import React.Basic.R3F.Three (threejs)

meshPhongMaterial
  :: forall props
   . { | props }
  -> JSX
meshPhongMaterial = element (threejs "MeshPhongMaterial")

meshStandardMaterial
  :: forall props
   . { | props }
  -> JSX
meshStandardMaterial = element (threejs "MeshStandardMaterial")

meshLambertMaterial
  :: forall props
   . { | props }
  -> JSX
meshLambertMaterial = element (threejs "MeshLambertMaterial")

meshNormalMaterial
  :: forall props
   . { | props }
  -> JSX
meshNormalMaterial = element (threejs "MeshNormalMaterial")

