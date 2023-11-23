module React.Basic.R3F.Materials
  ( meshLambertMaterial
  , meshPhongMaterial
  , meshStandardMaterial
  ) where

import Prelude

import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)

meshPhongMaterial
  :: forall props
   . Record props
  -> JSX
meshPhongMaterial = element (threejs "MeshPhongMaterial")

meshStandardMaterial
  :: forall props
   . Record props
  -> JSX
meshStandardMaterial = element (threejs "MeshStandardMaterial")

meshLambertMaterial
  :: forall props
   . Record props
  -> JSX
meshLambertMaterial = element (threejs "MeshLambertMaterial")

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafeCreateDOMComponent >>> unsafePerformEffect

