module React.Basic.R3F.Types
  ( class Object3D
  , setPosition
  , setRotation
  , add
  , updateMatrix
  , matrix
  ) where

import Prelude

import Data.Function.Uncurried (Fn3, mkFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import React.Basic (JSX, Ref)
import React.Basic.R3F.Three (Matrix4, Scene)
import Unsafe.Coerce (unsafeCoerce)

-- | Represents the base class for most objects in `three.js`. It provides a set
-- | of functions to manipulate objects in 3D space.
class Object3D a b | a -> b where
  setPosition :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  setRotation :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  -- | Adds an object as child of this object.
  add :: a -> b -> Effect Unit
  -- | Updates the local transform.
  updateMatrix :: a -> Effect Unit
  -- | The local transform matrix.
  matrix :: a -> Effect Matrix4

instance object3DRefJSX :: Object3D (Ref JSX) JSX where
  setPosition = \obj -> runEffectFn2 setPositionByRefImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationByRefImpl obj <<< mkFn3
  add = runEffectFn2 addByRefImpl
  updateMatrix = runEffectFn1 updateMatrixByRefImpl
  matrix = runEffectFn1 matrixByRefImpl

instance object3DJSX :: Object3D JSX JSX where
  setPosition = \obj -> runEffectFn2 setPositionImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl obj <<< mkFn3
  add = runEffectFn2 addImpl
  updateMatrix = runEffectFn1 updateMatrixImpl
  matrix = runEffectFn1 matrixImpl

instance object3DScene :: Object3D Scene JSX where
  setPosition = \obj -> runEffectFn2 setPositionImpl (unsafeCoerce obj) <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl (unsafeCoerce obj) <<< mkFn3
  add = runEffectFn2 addImpl <<< unsafeCoerce
  updateMatrix = runEffectFn1 updateMatrixImpl <<< unsafeCoerce
  matrix = runEffectFn1 matrixImpl <<< unsafeCoerce

foreign import setPositionByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import addByRefImpl :: EffectFn2 (Ref JSX) JSX Unit
foreign import setPositionImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import addImpl :: EffectFn2 JSX JSX Unit

foreign import updateMatrixImpl :: EffectFn1 JSX Unit
foreign import updateMatrixByRefImpl :: EffectFn1 (Ref JSX) Unit
foreign import matrixImpl :: EffectFn1 JSX Matrix4
foreign import matrixByRefImpl :: EffectFn1 (Ref JSX) Matrix4

