module React.Basic.R3F.Types where

import Prelude

import Effect.Uncurried (EffectFn1, EffectFn2)
import React.Basic (JSX, Ref)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type

foreign import getElapsedTime :: EffectFn1 Clock Number

-- | A subset of attributes of [three.js#Object3D](https://threejs.org/docs/#api/en/core/Object3D)
type Props_Object3D =
  ( position :: Array Number
  , rotation :: Array Number
  )

-- This is intrinsically unsafe. Is there anything better?
foreign import setPosition :: EffectFn2 (Ref JSX) (Array Number) Unit
foreign import setRotation :: EffectFn2 (Ref JSX) (Array Number) Unit

