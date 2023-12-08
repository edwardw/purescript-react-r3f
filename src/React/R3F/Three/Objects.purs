module React.R3F.Three.Objects where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Foreign (Foreign)
import React.Basic (JSX, Ref)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import React.R3F.Three.Types (InstancedMesh, Matrix4)

mesh
  :: forall args props
   . { | args }
  -> { | props }
  -> JSX
mesh = elementWithArgs (threejs "Mesh") flattenMeshArgs

instancedMesh
  :: forall args props
   . { | args }
  -> { | props }
  -> JSX
instancedMesh = elementWithArgs (threejs "InstancedMesh") flattenInstancedMeshArgs

class InstancedMesh a where
  setMatrixAt :: a -> Int -> Matrix4 -> Effect Unit

instance instancedMeshSelf :: InstancedMesh InstancedMesh where
  setMatrixAt = runEffectFn3 instancedMeshSetMatrixAt

instance instancedMeshJSXRef :: InstancedMesh (Ref JSX) where
  setMatrixAt = runEffectFn3 refSetMatrixAt

foreign import flattenMeshArgs :: forall args. { | args } -> Array Foreign
foreign import flattenInstancedMeshArgs :: forall args. { | args } -> Array Foreign
foreign import instancedMeshSetMatrixAt :: EffectFn3 InstancedMesh Int Matrix4 Unit
foreign import refSetMatrixAt :: EffectFn3 (Ref JSX) Int Matrix4 Unit

