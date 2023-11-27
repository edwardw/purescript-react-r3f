module React.Basic.R3F.Hooks where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn2, runEffectFn1, runEffectFn2)
import React.Basic (JSX, Ref)
import React.Basic.Hooks (Hook, unsafeHook)
import React.Basic.R3F.Types as Three

foreign import data UseFrame :: Type -> Type -> Type

foreign import useFrameImpl
  :: EffectFn1 (EffectFn2 (Record RootState) Number Unit) Unit
foreign import applyRefPropsImpl
  :: forall props. EffectFn2 (Ref JSX) (Record props) Unit

type RootState =
  ( clock :: Three.Clock
  , pointer :: Three.Vector2
  )

useFrame
  :: ((Record RootState) -> Number -> Effect Unit)
  -> Hook (UseFrame (Record RootState)) Unit
useFrame = unsafeHook <<< runEffectFn1 useFrameImpl <<< mkEffectFn2

-- | Sets element properties
-- |
-- | For example:
-- | ```
-- |      applyRefProps cubeRef { position: [0.0, 0.0, 0.0 ] }
-- | ```
-- | If want to reach into the nested properties, use dash-case:
-- | ```
-- |      applyRefProps cubeRef { position-x: 0.0 }
-- | ```
-- |
-- | Caveat: the underlying `@react-three/fiber` function seems to have
-- | performance issue. Do not use it inside `useFramce` callbacks. In one such
-- | case, setting position and rotation of two objects inside `useFrame` sees
-- | fps drops from 144+ to around 100.
applyRefProps
  :: forall props
   . Ref JSX
  -> Record props
  -> Effect Unit
applyRefProps = runEffectFn2 applyRefPropsImpl

