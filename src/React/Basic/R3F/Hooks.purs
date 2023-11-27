module React.Basic.R3F.Hooks where

import Prelude

import Data.Lens (Lens')
import Data.Lens as Lens
import Data.Lens.Record (prop)
import Data.Symbol (class IsSymbol)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn2, runEffectFn1, runEffectFn2)
import Prim.Row (class Cons)
import React.Basic (JSX, Ref)
import React.Basic.Hooks (Hook, unsafeHook)
import React.Basic.R3F (Scene)
import React.Basic.R3F.Misc (Scene) as Three
import React.Basic.R3F.Types (Clock, Vector2, WebGLRenderer) as Three
import React.Basic.R3F.Types (WebGLRenderer)
import Type.Prelude (Proxy)
import Unsafe.Coerce (unsafeCoerce)

type RootState =
  ( clock :: Three.Clock
  , pointer :: Three.Vector2
  , scene :: Three.Scene
  , renderer :: Three.WebGLRenderer
  )

useFrame
  :: ((Record RootState) -> Number -> Effect Unit)
  -> Hook (UseFrame (Record RootState)) Unit
useFrame = unsafeHook <<< runEffectFn1 useFrameImpl <<< mkEffectFn2

useThree
  :: forall @k v props
   . IsSymbol k
  => Cons k v props RootState
  => Proxy k
  -> Hook (UseThree v) v
useThree k = unsafeHook $ runEffectFn1 useThreeImpl getter
  where
  getter :: Record RootState -> v
  getter = Lens.view lens

  lens :: Lens' (Record RootState) v
  lens = prop k

-- | Sets element properties
-- |
-- | For example:
-- | ```
-- |      applyProps cubeRef { position: [0.0, 0.0, 0.0 ] }
-- | ```
-- | If want to reach into the nested properties, use dash-case:
-- | ```
-- |      applyProps cubeRef { position-x: 0.0 }
-- | ```
-- |
-- | Caveat: the underlying `@react-three/fiber` function seems to have
-- | performance issue. Do not use it inside `useFramce` callbacks. In one such
-- | case, setting position and rotation of two objects inside `useFrame` with
-- | this function sees fps drops from 144+ to around 100. Only fallack to this
-- | function if there are no corresponding functions in `Object3D` type class.
class ApplyProps a where
  applyProps :: forall props. a -> Record props -> Effect Unit

instance applyPropsRefJSX :: ApplyProps (Ref JSX) where
  applyProps = runEffectFn2 applyRefPropsImpl

instance applyPropsJSX :: ApplyProps JSX where
  applyProps = runEffectFn2 applyPropsImpl

instance applyPropsScene :: ApplyProps Scene where
  applyProps = \scene -> runEffectFn2 applyPropsImpl (unsafeCoerce scene)

instance applyPropsWebGLRenderer :: ApplyProps WebGLRenderer where
  applyProps = \scene -> runEffectFn2 applyPropsImpl (unsafeCoerce scene)

foreign import data UseFrame :: Type -> Type -> Type
foreign import data UseThree :: Type -> Type -> Type

foreign import useFrameImpl
  :: EffectFn1 (EffectFn2 (Record RootState) Number Unit) Unit

foreign import useThreeImpl
  :: forall subset. EffectFn1 ((Record RootState) -> subset) subset

foreign import applyPropsImpl
  :: forall props. EffectFn2 JSX (Record props) Unit

foreign import applyRefPropsImpl
  :: forall props. EffectFn2 (Ref JSX) (Record props) Unit

