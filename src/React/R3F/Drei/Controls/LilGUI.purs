-- | The lil-gui component
-- |
-- | It is not a `@react-three/fiber` component and will be rendered outside the
-- | `@react-three/fiber` root canvas. Creating one is enough for a gui to show
-- | up.
module React.R3F.Drei.Controls.LilGUI
  ( GUI
  , Controller
  , create
  , add
  , addColor
  , addFolder
  , open
  , close
  , name
  , onChange
  , Controls(..)
  ) where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, mkEffectFn1, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Prim.Row (class Cons)
import Type.Prelude (Proxy(..))

foreign import data GUI :: Type
foreign import data Controller :: Type -> Type

data Controls a
  = Checkbox
  | TextField String
  | NumberField Number Number Number
  | Button
  | Dropdown (Array a)

add
  :: forall @tag ty props_ props
   . IsSymbol tag
  => Cons tag ty props_ props
  => { | props }
  -> (Controls ty)
  -> GUI
  -> Effect (Controller ty)
add = runEffectFn4 addImpl (reflectSymbol (Proxy :: _ tag))

addColor
  :: forall @tag props_ props
   . IsSymbol tag
  => Cons tag String props_ props
  => { | props }
  -> GUI
  -> Effect (Controller String)
addColor = runEffectFn3 addColorImpl (reflectSymbol (Proxy :: _ tag))

addFolder :: String -> GUI -> Effect GUI
addFolder = runEffectFn2 addFolderImpl

open :: GUI -> Effect GUI
open = runEffectFn1 openImpl

close :: GUI -> Effect GUI
close = runEffectFn1 closeImpl

name
  :: forall a
   . String
  -> (Controller a)
  -> Effect (Controller a)
name = runEffectFn2 nameImpl

onChange
  :: forall a
   . (a -> Effect Unit)
  -> (Controller a)
  -> Effect (Controller a)
onChange cb = runEffectFn2 onChangeImpl (mkEffectFn1 cb)

foreign import create :: Effect GUI
foreign import addImpl
  :: forall a props. EffectFn4 String { | props } (Controls a) GUI (Controller a)

foreign import addColorImpl
  :: forall a props. EffectFn3 String { | props } GUI (Controller a)

foreign import addFolderImpl :: EffectFn2 String GUI GUI
foreign import openImpl :: EffectFn1 GUI GUI
foreign import closeImpl :: EffectFn1 GUI GUI
foreign import nameImpl
  :: forall a. EffectFn2 String (Controller a) (Controller a)

foreign import onChangeImpl
  :: forall a. EffectFn2 (EffectFn1 a Unit) (Controller a) (Controller a)

