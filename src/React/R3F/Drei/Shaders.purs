module React.R3F.Drei.Shaders where

import Prelude

import Data.Function.Uncurried (Fn3, runFn3)
import Data.Symbol (class IsSymbol, reflectSymbol)
import React.Basic (JSX, ReactComponent, element)
import React.R3F.Three.Internal (StartWithUppercase, extend, threejs)
import React.R3F.Three.Materials (MaterialProps)
import React.R3F.Three.Objects (LODProps)
import Type.Prelude (Proxy(..))
import Type.Regex (class TestRegex)
import Type.Row (type (+))

type ShaderMaterialProps a b c d e r =
  ( clipping :: Boolean
  , defaultAttributeValues :: { | a }
  , extensions ::
      { derivatives :: Boolean
      , fragDepth :: Boolean
      , drawBuffers :: Boolean
      , shaderTextureLOD :: Boolean
      | (LODProps b)
      }
  , fog :: Boolean
  , glslVersion :: String
  , index0AttributeName :: String
  , isShaderMaterial :: Boolean
  , lights :: Boolean
  , linewidth :: Number
  , flatShading :: Boolean
  , uniforms :: { | c }
  , uniformsNeedUpdate :: Boolean
  , vertexColors :: Boolean
  , wireframe :: Boolean
  , wireframeLinewidth :: Number
  | (MaterialProps d e) + r
  )

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

foreign import shaderMaterialImpl
  :: forall args props
   . Fn3 { | args } String String (ReactComponent { | props })

