module React.Basic.R3F.Loaders
  ( Texture
  , UseLoader
  , useTexture
  ) where

import Prelude

import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.Basic.Hooks (Hook, unsafeHook)

foreign import data Texture :: Type

foreign import data UseLoader :: Type -> Type -> Type

useTexture :: forall a. String -> Hook (UseLoader a) Texture
useTexture = unsafeHook <<< runEffectFn1 useTextureImpl

foreign import useTextureImpl :: EffectFn1 String Texture

