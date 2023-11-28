-- | The lil-gui component
-- |
-- | It is not a `@react-three/fiber` component and will be rendered outside the
-- | `@react-three/fiber` root canvas. Creating one is enough for a gui to show
-- | up.
module React.Basic.R3F.Controls.LilGUI
  ( GUI
  , create
  , add
  , addFolder
  , Controls(..)
  ) where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn4, runEffectFn4)
import Prim.Row (class Cons)
import Type.Prelude (Proxy(..))

foreign import data GUI :: Type

data Controls a
  = Checkbox
  | TextField String
  | NumberField Number Number Number
  | Button (Effect Unit)
  | Dropdown (Array a)

foreign import create :: Effect GUI
foreign import addImpl
  :: forall a props. EffectFn4 String GUI (Record props) (Controls a) Unit
foreign import addFolder :: EffectFn2 GUI String GUI

add
  :: forall @prop v props_ props a
   . IsSymbol prop
  => Cons prop v props_ props
  => GUI
  -> Record props
  -> Controls a
  -> Effect Unit
add = runEffectFn4 addImpl (reflectSymbol (Proxy :: _ prop))

