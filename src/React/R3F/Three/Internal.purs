module React.R3F.Three.Internal where

import Prelude

import Data.Function.Uncurried (Fn2, Fn4, runFn2, runFn4)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect.Unsafe (unsafePerformEffect)
import Foreign (Foreign)
import React.Basic (JSX, ReactComponent)
import React.Basic.DOM (unsafeCreateDOMComponent)
import Type.Prelude (Proxy(..))
import Type.Regex (class TestRegex)

elementWithArgs
  :: forall args props
   . ReactComponent { | props }
  -> ({ | args } -> Array Foreign)
  -> { | args }
  -> { | props }
  -> JSX
elementWithArgs = runFn4 elementImpl

extend
  :: forall @name a
   . IsSymbol name
  => TestRegex StartWithUppercase name
  => a
  -> Unit
extend = runFn2 extendImpl (reflectSymbol (Proxy :: _ name))

type StartWithUppercase = "^[A-Z][.]*"

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import elementImpl
  :: forall args props
   . Fn4 (ReactComponent { | props }) ({ | args } -> Array Foreign) { | args } { | props } JSX

foreign import extendImpl :: forall a. Fn2 String a Unit

