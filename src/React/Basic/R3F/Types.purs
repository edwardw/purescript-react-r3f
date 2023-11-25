module React.Basic.R3F.Types where

import Prelude

import Data.Function.Uncurried (Fn3)
import Effect.Uncurried (EffectFn1, EffectFn2)
import React.Basic (JSX, Ref)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type

foreign import getElapsedTime :: EffectFn1 Clock Number

foreign import setPosition :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotation :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit

