module React.R3F.Three.Types where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn4, runEffectFn1, runEffectFn4)
import Prim.Row (class Union)
import React.R3F.Three.Internal (null)
import Unsafe.Coerce (unsafeCoerce)

-- ===========================================================================
-- Core
-- ===========================================================================

foreign import data BufferAttribute :: Type
foreign import data BufferGeometry :: Type
foreign import data Clock :: Type
foreign import data InstancedBufferAttribute :: Type
foreign import data Object3D :: Type

foreign import createObject3D :: Effect Object3D

-- ===========================================================================
-- Geometries
-- ===========================================================================

foreign import data PlaneGeometry :: Type

createPlaneGeometry :: Number -> Number -> Int -> Int -> Effect PlaneGeometry
createPlaneGeometry = runEffectFn4 createPlaneGeometryImpl

foreign import createPlaneGeometryImpl
  :: EffectFn4 Number Number Int Int PlaneGeometry

-- ===========================================================================
-- Objects
-- ===========================================================================

foreign import data InstancedMesh :: Type
foreign import data LOD :: Type
foreign import data Mesh :: Type

-- ===========================================================================
-- Materials
-- ===========================================================================

foreign import data Material :: Type
foreign import data ShaderMaterial :: Type
foreign import meshNormalMaterial :: Effect Material

-- ===========================================================================
-- Math
-- ===========================================================================

foreign import data Box3 :: Type
foreign import data Color :: Type
foreign import data Matrix4 :: Type
foreign import data Plane :: Type
foreign import data Sphere :: Type
foreign import data Vector3 :: Type
foreign import data Vector2 :: Type

createColor :: String -> Effect Color
createColor = runEffectFn1 createColorImpl

createMatrix4 :: Array Number -> Effect Matrix4
createMatrix4 = runEffectFn1 createMatrix4Impl

createVector3 :: Array Number -> Effect Vector3
createVector3 = runEffectFn1 createVector3Impl

foreign import createColorImpl :: EffectFn1 String Color
foreign import createMatrix4Impl :: EffectFn1 (Array Number) Matrix4
foreign import createVector3Impl :: EffectFn1 (Array Number) Vector3

-- ===========================================================================
-- Renderers
-- ===========================================================================

foreign import data WebGLRenderer :: Type

-- ===========================================================================
-- Scenes
-- ===========================================================================

foreign import data Fog :: Type
foreign import data Scene :: Type

type FogArgs = (color :: String, near :: Number, far :: Number)

createFog
  :: forall args args_
   . Union args args_ FogArgs
  => { | args }
  -> Effect Fog
createFog = runEffectFn1 createFogImpl

foreign import createFogImpl :: forall props. EffectFn1 { | props } Fog

-- ===========================================================================
-- Textures
-- ===========================================================================

foreign import data Texture :: Type

-- | A placeholder texture.
-- |
-- | Occasionally useful, e.g. when one defines a shader material and wants
-- | textures as part of the shader parameters, but the concrete textures are
-- | only available when instantiating the material, then use this do-nothing
-- | placeholder texture.
placeholderTexture :: Texture
placeholderTexture = unsafeCoerce null

