module React.R3F.Three.Core where

import Prelude

import Data.Function.Uncurried (Fn3, mkFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Foreign (Foreign)
import React.Basic (JSX)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import React.R3F.Three.Types (Matrix4, Object3D)

class Object3D a where
  setPosition :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  setRotation :: a -> (Number -> Number -> Number -> (Array Number)) -> Effect Unit
  updateMatrix :: a -> Effect Unit
  matrix :: a -> Effect Matrix4

instance object3DSelf :: Object3D Object3D where
  setPosition = \obj -> runEffectFn2 setPositionImpl obj <<< mkFn3
  setRotation = \obj -> runEffectFn2 setRotationImpl obj <<< mkFn3
  updateMatrix = runEffectFn1 object3DUpdateMatrix
  matrix = runEffectFn1 object3DMatrix

instancedBufferAttribute
  :: forall args props
   . { | args }
  -> { | props }
  -> JSX
instancedBufferAttribute =
  elementWithArgs (threejs "InstancedBufferAttribute") flattenInstancedBAArgs

foreign import setPositionImpl :: EffectFn2 Object3D (Fn3 Number Number Number (Array Number)) Unit
foreign import setRotationImpl :: EffectFn2 Object3D (Fn3 Number Number Number (Array Number)) Unit
foreign import object3DUpdateMatrix :: EffectFn1 Object3D Unit
foreign import object3DMatrix :: EffectFn1 Object3D Matrix4
foreign import flattenInstancedBAArgs :: forall args. { | args } -> Array Foreign

