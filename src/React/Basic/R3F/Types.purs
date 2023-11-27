module React.Basic.R3F.Types
  ( Clock
  , Vector2
  , class Object3D
  , setPosition
  , setRotation
  , add
  ) where

import Prelude

import Data.Function.Uncurried (Fn3)
import Effect.Uncurried (EffectFn1, EffectFn2)
import React.Basic (JSX, Ref)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type

foreign import getElapsedTime :: EffectFn1 Clock Number

-- | Represents the base class for most objects in `three.js`. It provides a set
-- | of functions to manipulate objects in 3D space.
class Object3D a where
  setPosition :: EffectFn2 a (Fn3 Number Number Number (Array Number)) Unit
  setRotation :: EffectFn2 a (Fn3 Number Number Number (Array Number)) Unit
  -- | Adds an object as child of this object.
  add :: EffectFn2 a JSX Unit

instance object3DRefJSX :: Object3D (Ref JSX) where
  setPosition = setPositionImpl
  setRotation = setRotationImpl
  add = addImpl

foreign import setPositionImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import addImpl :: EffectFn2 (Ref JSX) JSX Unit

