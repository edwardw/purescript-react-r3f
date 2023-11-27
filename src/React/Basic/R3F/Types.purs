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
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn2, runEffectFn2)
import React.Basic (JSX, Ref)
import React.Basic.R3F (Scene)
import Unsafe.Coerce (unsafeCoerce)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type

foreign import getElapsedTime :: EffectFn1 Clock Number

-- | Represents the base class for most objects in `three.js`. It provides a set
-- | of functions to manipulate objects in 3D space.
class Object3D a b | a -> b where
  setPosition :: EffectFn2 a (Fn3 Number Number Number (Array Number)) Unit
  setRotation :: EffectFn2 a (Fn3 Number Number Number (Array Number)) Unit
  -- | Adds an object as child of this object.
  add :: EffectFn2 a b Unit

instance object3DRefJSX :: Object3D (Ref JSX) JSX where
  setPosition = setPositionByRefImpl
  setRotation = setRotationByRefImpl
  add = addByRefImpl

instance object3DJSX :: Object3D JSX JSX where
  setPosition = setPositionImpl
  setRotation = setRotationImpl
  add = addImpl

instance object3DScene :: Object3D Scene JSX where
  setPosition = mkEffectFn2 \obj -> runEffectFn2 setPositionImpl (unsafeCoerce obj)
  setRotation = mkEffectFn2 \obj -> runEffectFn2 setRotationImpl (unsafeCoerce obj)
  add = mkEffectFn2 \parent -> runEffectFn2 addImpl (unsafeCoerce parent)

foreign import setPositionByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import addByRefImpl :: EffectFn2 (Ref JSX) JSX Unit
foreign import setPositionImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import addImpl :: EffectFn2 JSX JSX Unit

