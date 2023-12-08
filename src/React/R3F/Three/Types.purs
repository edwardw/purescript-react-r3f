module React.R3F.Three.Types where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

-- =======================================
-- ==             Core                  ==
-- =======================================

foreign import data Object3D :: Type

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

foreign import data Matrix4 :: Type

