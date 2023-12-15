module React.R3F.Hooks where

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
import React.R3F.Three.Types (Object3D, Texture)
import React.R3F.Three.Types as Three
import Type.Prelude (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

type RootState =
  ( clock :: Three.Clock
  , pointer :: Three.Vector2
  , scene :: Three.Scene
  , gl :: Three.WebGLRenderer
  , invalidate :: Effect Unit
  )

useFrame
  :: ({ | RootState } -> Number -> Effect Unit)
  -> Hook (UseFrame { | RootState }) Unit
useFrame = unsafeHook <<< runEffectFn1 useFrameImpl <<< mkEffectFn2

useThree
  :: forall @tag ty props
   . IsSymbol tag
  => Cons tag ty props RootState
  => Hook (UseThree ty) ty
useThree = unsafeHook $ runEffectFn1 useThreeImpl getter
  where
  getter :: { | RootState } -> ty
  getter = Lens.view lens

  lens :: Lens' { | RootState } ty
  lens = prop (Proxy :: _ tag)

-- | Sets element properties
-- |
-- | For example:
-- | ```
-- |      applyProps cubeRef { position: [ 0.0, 0.0, 0.0 ] }
-- | ```
-- | If want to reach into the nested properties, use dash-case:
-- | ```
-- |      applyProps cubeRef { "position-x": 0.0 }
-- | ```
class ApplyProps a where
  applyProps :: forall props. a -> { | props } -> Effect Unit

instance applyPropsRefJSX :: ApplyProps (Ref JSX) where
  applyProps = runEffectFn2 applyRefPropsImpl

instance applyPropsJSX :: ApplyProps JSX where
  applyProps = runEffectFn2 applyPropsImpl

instance applyPropsScene :: ApplyProps Three.Scene where
  applyProps = runEffectFn2 applyScenePropsImpl

instance applyPropsWebGLRenderer :: ApplyProps Three.WebGLRenderer where
  applyProps = \gl -> runEffectFn2 applyPropsImpl (unsafeCoerce gl)

instance applyPropsTexture :: ApplyProps Texture where
  applyProps = \texture -> runEffectFn2 applyPropsImpl (unsafeCoerce texture)

instance applyPropsObject3D :: ApplyProps Object3D where
  applyProps = \obj -> runEffectFn2 applyPropsImpl (unsafeCoerce obj)

foreign import data UseFrame :: Type -> Type -> Type
foreign import data UseThree :: Type -> Type -> Type

foreign import useFrameImpl
  :: EffectFn1 (EffectFn2 { | RootState } Number Unit) Unit

foreign import useThreeImpl
  :: forall subset. EffectFn1 ({ | RootState } -> subset) subset

foreign import applyPropsImpl
  :: forall props. EffectFn2 JSX { | props } Unit

foreign import applyRefPropsImpl
  :: forall props. EffectFn2 (Ref JSX) { | props } Unit

foreign import applyScenePropsImpl
  :: forall props. EffectFn2 Three.Scene { | props } Unit

