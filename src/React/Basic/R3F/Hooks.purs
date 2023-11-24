module React.Basic.R3F.Hooks where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn2, runEffectFn1)
import React.Basic.Hooks (Hook, unsafeHook)
import React.Basic.R3F.Types as Three

foreign import data UseFrame :: Type -> Type -> Type

foreign import useFrameImpl
  :: EffectFn1 (EffectFn2 { | RootState } Number Unit) Unit

type RootState =
  ( clock :: Three.Clock
  , pointer :: Three.Vector2
  )

useFrame
  :: ({ | RootState } -> Number -> Effect Unit)
  -> Hook (UseFrame { | RootState }) Unit
useFrame = unsafeHook <<< runEffectFn1 useFrameImpl <<< mkEffectFn2

