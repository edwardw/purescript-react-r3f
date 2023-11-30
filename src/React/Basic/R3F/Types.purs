module React.Basic.R3F.Types
  ( Clock
  , Vector2
  , WebGLRenderer
  , class Object3D
  , Color
  , createColor
  , setPosition
  , setRotation
  , add
  , ShadowMapType(..)
  ) where

import Prelude

import Data.Enum (class BoundedEnum, class Enum, Cardinality(..))
import Data.Function.Uncurried (Fn3)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn2, runEffectFn1, runEffectFn2)
import React.Basic (JSX, Ref)
import React.Basic.R3F (Scene)
import Unsafe.Coerce (unsafeCoerce)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type
foreign import data WebGLRenderer :: Type
foreign import data Color :: Type

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

data ShadowMapType = BasicShadowMap | PCFShadowMap | PCFSoftShadowMap | VSMShadowMap

derive instance eqShadowMapType :: Eq ShadowMapType
derive instance ordShadowMapType :: Ord ShadowMapType

instance enumShadowMapType :: Enum ShadowMapType where
  succ BasicShadowMap = Just PCFShadowMap
  succ PCFShadowMap = Just PCFSoftShadowMap
  succ PCFSoftShadowMap = Just VSMShadowMap
  succ VSMShadowMap = Nothing
  pred VSMShadowMap = Just PCFSoftShadowMap
  pred PCFSoftShadowMap = Just PCFShadowMap
  pred PCFShadowMap = Just BasicShadowMap
  pred BasicShadowMap = Nothing

instance boundedShadowMapType :: Bounded ShadowMapType where
  top = VSMShadowMap
  bottom = BasicShadowMap

instance boundedEnumShadowMapType :: BoundedEnum ShadowMapType where
  cardinality = Cardinality 4
  toEnum 0 = Just BasicShadowMap
  toEnum 1 = Just PCFShadowMap
  toEnum 2 = Just PCFSoftShadowMap
  toEnum 3 = Just VSMShadowMap
  toEnum _ = Nothing
  fromEnum BasicShadowMap = 0
  fromEnum PCFShadowMap = 1
  fromEnum PCFSoftShadowMap = 2
  fromEnum VSMShadowMap = 3

foreign import setPositionByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationByRefImpl :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import addByRefImpl :: EffectFn2 (Ref JSX) JSX Unit
foreign import setPositionImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 JSX (Fn3 Number Number Number (Array Number)) Unit
foreign import addImpl :: EffectFn2 JSX JSX Unit

foreign import createColorImpl :: EffectFn1 String Color

createColor :: String -> Effect Color
createColor = runEffectFn1 createColorImpl

