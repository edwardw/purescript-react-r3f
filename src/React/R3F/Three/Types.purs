module React.R3F.Three.Types where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

-- =======================================
-- ==             Core                  ==
-- =======================================

foreign import data Object3D :: Type
foreign import data BufferGeometry :: Type
foreign import data InstancedBufferAttribute :: Type

foreign import createObject3D :: Effect Object3D

-- =======================================
-- ==             Objects               ==
-- =======================================

foreign import data Mesh :: Type
foreign import data InstancedMesh :: Type

createMatrix4 :: Array Number -> Effect Matrix4
createMatrix4 = runEffectFn1 createMatrix4Impl

foreign import createMatrix4Impl :: EffectFn1 (Array Number) Matrix4

-- =======================================
-- ==          Materials                ==
-- =======================================

foreign import data Material :: Type
foreign import data MeshLambertMaterial :: Type

-- =======================================
-- ==             Math                  ==
-- =======================================

foreign import data Color :: Type
foreign import data Matrix4 :: Type
foreign import data Vector3 :: Type

createColor :: String -> Effect Color
createColor = runEffectFn1 createColorImpl

createVector3 :: Array Number -> Effect Vector3
createVector3 = runEffectFn1 createVector3Impl

foreign import createColorImpl :: EffectFn1 String Color
foreign import createVector3Impl :: EffectFn1 (Array Number) Vector3

