module React.R3F.Drei.Shaders where

import Prelude

import Data.Function.Uncurried (Fn3, runFn3)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.R3F.Three.Internal (StartWithUppercase, extend, threejs)
import React.R3F.Three.Materials (MaterialProps)
import Type.Prelude (Proxy(..))
import Type.Regex (class TestRegex)
import Type.Row (type (+))

type ShaderMaterialProps a b c d r =
  ( clipping :: Boolean
  , defaultAttributeValues :: { | a }
  , extensions ::
      { derivatives :: Boolean
      , fragDepth :: Boolean
      , drawBuffers :: Boolean
      , shaderTextureLOD :: Boolean
      }
  , fog :: Boolean
  , glslVersion :: String
  , index0AttributeName :: String
  , isShaderMaterial :: Boolean
  , lights :: Boolean
  , linewidth :: Number
  , flatShading :: Boolean
  , uniforms :: { | b }
  , uniformsNeedUpdate :: Boolean
  , vertexColors :: Boolean
  , wireframe :: Boolean
  , wireframeLinewidth :: Number
  | (MaterialProps c d) + r
  )

-- | A material rendered with custom shaders.
-- |
-- | A shader is a small GLSL program that runs on the GPU. Each shader material
-- | can receive two different shaders: a vertex shader and a fragment shader.
-- |
-- | A shader material also have to have a name and the name must starts with an
-- | uppercase character which is dictated by the underlying `threejs` platform.
-- |
-- | [Reference](https://threejs.org/docs/index.html#api/en/materials/ShaderMaterial)
shaderMaterial
  :: forall @materialName args props
   . IsSymbol materialName
  => TestRegex StartWithUppercase materialName
  => { | args }
  -> String
  -> String
  -> { | props }
  -> JSX
shaderMaterial args vertexShader fragmentShader =
  let
    mat = runFn3 shaderMaterialImpl args vertexShader fragmentShader
    _ = extend @materialName mat
  in
    element $ threejs $ reflectSymbol (Proxy :: _ materialName)

type SoftShadowsProps =
  ( size :: Number
  , focus :: Number
  , samples :: Int
  )

-- | Injects percent closer soft shadows (PCSS) into the scene.
-- |
-- | Properties:
-- |   - size: size of the light source (the larger the softer the light),
-- | default 25
-- |   - focus: depth focus, use it to shift the focal point (where the shadow is
-- | the sharpest), default 0 (the beginning)
-- |   - samples: number of samples (more samples less noise but more
-- |   expensive), default 10
softShadows
  :: forall props props_
   . Union props props_ SoftShadowsProps
  => { | props }
  -> JSX
softShadows = element softShadowsImpl

foreign import shaderMaterialImpl
  :: forall args props
   . Fn3 { | args } String String (ReactComponent { | props })

-- | A `MeshTransmissionMaterial` is improved `threejs MeshPhysicalMaterial`.
-- TODO: tighten the props type
meshTransmissionMaterial
  :: forall props
   . { | props }
  -> JSX
meshTransmissionMaterial = element meshTransmissionMaterialImpl

foreign import softShadowsImpl :: forall props. ReactComponent { | props }
foreign import meshTransmissionMaterialImpl :: forall props. ReactComponent { | props }

