module React.Basic.R3F.Internal (elementWithArgs, threejs) where

import Prelude

import Data.Function.Uncurried (Fn4, runFn4)
import Effect.Unsafe (unsafePerformEffect)
import Foreign (Foreign)
import React.Basic (JSX, ReactComponent)
import React.Basic.DOM (unsafeCreateDOMComponent)

elementWithArgs
  :: forall args props
   . ReactComponent { | props }
  -> ({ | args } -> Foreign)
  -> { | args }
  -> { | props }
  -> JSX
elementWithArgs = runFn4 elementImpl

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import elementImpl
  :: forall args props
   . Fn4 (ReactComponent { | props }) ({ | args } -> Foreign) { | args } { | props } JSX

