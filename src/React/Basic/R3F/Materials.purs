module React.Basic.R3F.Materials
  ( meshLambertMaterial
  , meshPhongMaterial
  , meshStandardMaterial
  , meshNormalMaterial
  ) where

import Prelude

import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)

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

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

