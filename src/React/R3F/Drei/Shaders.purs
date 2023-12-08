module React.R3F.Drei.Shaders where

import Prelude

import Data.Function.Uncurried (Fn3, runFn3)
import Data.Symbol (class IsSymbol, reflectSymbol)
import React.Basic (JSX, ReactComponent, element)
import React.R3F.Three.Internal (StartWithUppercase, extend, threejs)
import Type.Prelude (Proxy(..))
import Type.Regex (class TestRegex)

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

