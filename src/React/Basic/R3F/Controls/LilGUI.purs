-- | The lil-gui component
-- |
-- | It is not a `@react-three/fiber` component and will be rendered outside the
-- | `@react-three/fiber` root canvas. Creating one is enough for a gui to show
-- | up.
module React.Basic.R3F.Controls.LilGUI
  ( GUI
  , Controller
  , create
  , add
  , addFolder
  , open
  , close
  , name
  , LilGUIControls(..)
  ) where

import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn4, runEffectFn1, runEffectFn2, runEffectFn4)
import Prim.Row (class Cons)
import Type.Prelude (Proxy(..))

foreign import data GUI :: Type
foreign import data Controller :: Type

data LilGUIControls a
  = Checkbox
  | TextField String
  | NumberField Number Number Number
  | Button
  | Dropdown (Array a)

foreign import create :: Effect GUI
foreign import addImpl
  :: forall a props. EffectFn4 String (Record props) (LilGUIControls a) GUI Controller

foreign import addFolderImpl :: EffectFn2 String GUI GUI
foreign import openImpl :: EffectFn1 GUI GUI
foreign import closeImpl :: EffectFn1 GUI GUI
foreign import nameImpl :: EffectFn2 String Controller Controller

add
  :: forall @prop v props_ props a
   . IsSymbol prop
  => Cons prop v props_ props
  => (Record props)
  -> (LilGUIControls a)
  -> GUI
  -> Effect Controller
add = runEffectFn4 addImpl (reflectSymbol (Proxy :: _ prop))

addFolder :: String -> GUI -> Effect GUI
addFolder = runEffectFn2 addFolderImpl

open :: GUI -> Effect GUI
open = runEffectFn1 openImpl

close :: GUI -> Effect GUI
close = runEffectFn1 closeImpl

name :: String -> Controller -> Effect Controller
name = runEffectFn2 nameImpl

