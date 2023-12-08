module React.R3F.Three.Math where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.R3F.Three.Types (Color, Matrix4)

createColor :: String -> Effect Color
createColor = runEffectFn1 createColorImpl

class Matrix4 a where
  clone :: a -> Effect a

instance matrix4Self :: Matrix4 Matrix4 where
  clone = runEffectFn1 matrix4Clone

foreign import createColorImpl :: EffectFn1 String Color
foreign import matrix4Clone :: EffectFn1 Matrix4 Matrix4

