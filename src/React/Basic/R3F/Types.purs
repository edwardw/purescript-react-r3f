module React.Basic.R3F.Types
  ( class Object3D
  , setPosition
  , setRotation
  , add
  ) where

import Prelude

import Data.Function.Uncurried (Fn3, mkFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import React.Basic (JSX, Ref)
import React.Basic.R3F.Three as Three
import Unsafe.Coerce (unsafeCoerce)

-- | Represents the base class for most objects in `three.js`. It provides a set
-- | of functions to manipulate objects in 3D space.
class Object3D a b | a -> b where
  setPosition :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  setRotation :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  -- | Adds an object as child of this object.
  add :: a -> b -> Effect Unit

instance object3DRefJSX :: Object3D (Ref JSX) JSX where
  setPosition = \obj -> runEffectFn2 setPositionByRefImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationByRefImpl obj <<< mkFn3
  add = runEffectFn2 addByRefImpl

instance object3DJSX :: Object3D JSX JSX where
  setPosition = \obj -> runEffectFn2 setPositionImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl obj <<< mkFn3
  add = runEffectFn2 addImpl

instance object3DScene :: Object3D Three.Scene JSX where
  setPosition = \obj -> runEffectFn2 setPositionImpl (unsafeCoerce obj) <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl (unsafeCoerce obj) <<< mkFn3
  add = runEffectFn2 addImpl <<< unsafeCoerce

instance object3DSelf :: Object3D Three.Object3D JSX where
  setPosition = \obj -> runEffectFn2 setPositionImpl (unsafeCoerce obj) <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl (unsafeCoerce obj) <<< mkFn3
  add = runEffectFn2 addImpl <<< unsafeCoerce

foreign import setPositionByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import addByRefImpl :: EffectFn2 (Ref JSX) JSX Unit
foreign import setPositionImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import addImpl :: EffectFn2 JSX JSX Unit

