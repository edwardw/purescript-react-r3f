module React.R3F.Three.Core where

import Prelude

import Data.ArrayBuffer.Types (ArrayView)
import Data.Function.Uncurried (Fn3, mkFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX, Ref, element)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import React.R3F.Three.Types (BufferAttribute, BufferGeometry, Clock, Matrix4, Object3D, PlaneGeometry, Vector3)
import Unsafe.Coerce (unsafeCoerce)

class Object3D a where
  setPosition :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  setRotation :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  updateMatrix :: a -> Effect Unit
  getMatrix :: a -> Effect Matrix4

instance object3DSelf :: Object3D Object3D where
  setPosition = \obj -> runEffectFn2 setPositionImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl obj <<< mkFn3
  updateMatrix = runEffectFn1 object3DUpdateMatrix
  getMatrix = runEffectFn1 object3DMatrix

instance object3DRefJSX :: Object3D (Ref JSX) where
  setPosition = \ref -> runEffectFn2 refSetPosition ref <<< mkFn3
  setRotation = \ref -> runEffectFn2 refSetRotation ref <<< mkFn3
  updateMatrix = runEffectFn1 refUpdateMatrix
  getMatrix = runEffectFn1 refMatrix

class BufferGeometry a where
  getIndex :: a -> Effect BufferAttribute
  getAttribute :: a -> String -> Effect BufferAttribute
  setAttribute :: a -> String -> BufferAttribute -> Effect Unit
  translate :: a -> Number -> Number -> Number -> Effect Unit
  lookAt :: a -> Vector3 -> Effect Unit

instance bufferGeometrySelf :: BufferGeometry BufferGeometry where
  getIndex = runEffectFn1 bufferGeoGetIndex
  getAttribute = runEffectFn2 bufferGeoGetAttribute
  setAttribute = runEffectFn3 bufferGeoSetAttribute
  translate = runEffectFn4 bufferGeoTranslate
  lookAt = runEffectFn2 bufferGeoLookAt

instance bufferGeometryRefJSX :: BufferGeometry PlaneGeometry where
  getIndex = runEffectFn1 bufferGeoGetIndex <<< \plane -> unsafeCoerce plane
  getAttribute = runEffectFn2 bufferGeoGetAttribute <<< \plane -> unsafeCoerce plane
  setAttribute = runEffectFn3 bufferGeoSetAttribute <<< \plane -> unsafeCoerce plane
  translate = runEffectFn4 bufferGeoTranslate <<< \plane -> unsafeCoerce plane
  lookAt = runEffectFn2 bufferGeoLookAt <<< \plane -> unsafeCoerce plane

class Clock a where
  getElapsedTime :: a -> Effect Number

instance clockSelf :: Clock Clock where
  getElapsedTime = runEffectFn1 clockGetElapsedTime

type InstancedBufferAttributeArgs a =
  ( array :: ArrayView a
  , itemSize :: Int
  , normalized :: Boolean
  , meshPerAttribute :: Int
  )

-- | An instanced version of BufferAttribute.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/core/InstancedBufferAttribute)
instancedBufferAttribute
  :: forall a args args_ props
   . Union args args_ (InstancedBufferAttributeArgs a)
  => { | args }
  -> { | props }
  -> JSX
instancedBufferAttribute =
  elementWithArgs (threejs "InstancedBufferAttribute") flattenInstancedBAArgs

-- | An instanced version of BufferGeometry.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/core/InstancedBufferGeometry)
instancedBufferGeometry
  :: forall props
   . { | props }
  -> JSX
instancedBufferGeometry = element (threejs "InstancedBufferGeometry")

foreign import setPositionImpl :: EffectFn2 Object3D (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 Object3D (Fn3 Number Number Number (Array Number)) Unit
foreign import object3DUpdateMatrix :: EffectFn1 Object3D Unit
foreign import object3DMatrix :: EffectFn1 Object3D Matrix4
foreign import refSetPosition :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import refSetRotation :: EffectFn2 (Ref JSX) (Fn3 Number Number Number (Array Number)) Unit
foreign import refUpdateMatrix :: EffectFn1 (Ref JSX) Unit
foreign import refMatrix :: EffectFn1 (Ref JSX) Matrix4
foreign import bufferGeoGetIndex :: EffectFn1 BufferGeometry BufferAttribute
foreign import bufferGeoGetAttribute :: EffectFn2 BufferGeometry String BufferAttribute
foreign import bufferGeoSetAttribute :: EffectFn3 BufferGeometry String BufferAttribute Unit
foreign import bufferGeoTranslate :: EffectFn4 BufferGeometry Number Number Number Unit
foreign import bufferGeoLookAt :: EffectFn2 BufferGeometry Vector3 Unit
foreign import clockGetElapsedTime :: EffectFn1 Clock Number
foreign import flattenInstancedBAArgs :: forall args. { | args } -> Array Foreign

