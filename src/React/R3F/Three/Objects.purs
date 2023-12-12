module React.R3F.Three.Objects where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Foreign (Foreign)
import Prim.Row (class Union)
import React.Basic (JSX, Ref, element)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import React.R3F.Three.Types (BufferGeometry, InstancedBufferAttribute, InstancedMesh, Material, Matrix4, Mesh)

-- | To group objects together.
-- |
-- | Other that making the group syntactically clearer, it has no rendering
-- | impact.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/objects/Group)
group
  :: forall props
   . { | props }
  -> JSX
group = element (threejs "Group")

type MeshArgs =
  ( geometry :: BufferGeometry
  , material :: Material
  )

-- | A polygon mesh.
-- |
-- | It takes a geometry and applies a material to it, which can then be
-- | rendered.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/objects/Mesh)
mesh
  :: forall args args_ props
   . Union args args_ MeshArgs
  => { | args }
  -> { | props }
  -> JSX
mesh = elementWithArgs (threejs "Mesh") flattenMeshArgs

type InstancedMeshArgs =
  ( geometry :: BufferGeometry
  , material :: Material
  , count :: Int
  )

-- | A special version of Mesh which supports instanced rendering.
-- |
-- | Use it if you want to render a large number of objects with the same
-- | geometry and material.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/objects/InstancedMesh)
instancedMesh
  :: forall args args_ props
   . Union args args_ InstancedMeshArgs
  => { | args }
  -> { | props }
  -> JSX
instancedMesh = elementWithArgs (threejs "InstancedMesh") flattenInstancedMeshArgs

class Mesh a where
  getGeometry :: a -> Effect BufferGeometry
  setGeometry :: a -> BufferGeometry -> Effect Unit

instance instanceMeshSelf :: Mesh Mesh where
  getGeometry = runEffectFn1 meshGetGeometry
  setGeometry = runEffectFn2 meshSetGeometry

instance instanceRefMesh :: Mesh (Ref JSX) where
  getGeometry = runEffectFn1 refGetGeometry
  setGeometry = runEffectFn2 refSetGeometry

class InstancedMesh a where
  setMatrixAt :: a -> Int -> Matrix4 -> Effect Unit
  getInstanceMatrix :: a -> Effect InstancedBufferAttribute

instance instancedMeshSelf :: InstancedMesh InstancedMesh where
  setMatrixAt = runEffectFn3 instancedMeshSetMatrixAt
  getInstanceMatrix = runEffectFn1 instancedMeshGetInstanceMatrix

instance instancedMeshJSXRef :: InstancedMesh (Ref JSX) where
  setMatrixAt = runEffectFn3 refSetMatrixAt
  getInstanceMatrix = runEffectFn1 refGetInstanceMatrix

foreign import flattenMeshArgs :: forall args. { | args } -> Array Foreign
foreign import flattenInstancedMeshArgs :: forall args. { | args } -> Array Foreign
foreign import meshGetGeometry :: EffectFn1 Mesh BufferGeometry
foreign import refGetGeometry :: EffectFn1 (Ref JSX) BufferGeometry
foreign import meshSetGeometry :: EffectFn2 Mesh BufferGeometry Unit
foreign import refSetGeometry :: EffectFn2 (Ref JSX) BufferGeometry Unit
foreign import instancedMeshSetMatrixAt :: EffectFn3 InstancedMesh Int Matrix4 Unit
foreign import refSetMatrixAt :: EffectFn3 (Ref JSX) Int Matrix4 Unit
foreign import instancedMeshGetInstanceMatrix :: EffectFn1 InstancedMesh InstancedBufferAttribute
foreign import refGetInstanceMatrix :: EffectFn1 (Ref JSX) InstancedBufferAttribute

