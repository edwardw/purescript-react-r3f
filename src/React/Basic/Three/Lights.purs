module React.Basic.Three.Lights where

import Prelude

import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)

ambientLight
  :: forall props
   . Record props
  -> JSX
ambientLight = element (threejs "AmbientLight")

directionalLight
  :: forall props
   . Record props
   -> JSX
directionalLight = element (threejs "DirectionalLight")

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafeCreateDOMComponent >>> unsafePerformEffect

