module React.R3F.Three.Materials where

import React.Basic (JSX)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import Unsafe.Coerce (unsafeCoerce)

meshLambertMaterial
  :: forall args props
   . { | args }
  -> { | props }
  -> JSX
meshLambertMaterial =
  elementWithArgs (threejs "MeshLambertMaterial") \args -> [ unsafeCoerce args ]

