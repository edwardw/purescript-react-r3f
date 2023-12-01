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
  :: forall @key value props_ props a
   . IsSymbol key
  => Cons key value props_ props
  => { | props }
  -> (Controls a)
  -> GUI
  -> Effect (Controller value)
add = runEffectFn4 addImpl (reflectSymbol (Proxy :: _ key))

addColor
  :: forall @key props_ props
   . IsSymbol key
  => Cons key String props_ props
  => { | props }
  -> GUI
  -> Effect (Controller String)
addColor = runEffectFn3 addColorImpl (reflectSymbol (Proxy :: _ key))

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

-- Subtle: `onChangeImpl` has a callback of signature
--    EffectFn1 String Unit
-- and `onChange`
--    String -> Effect Unit
-- If passing the curried version directly to `onChangeImpl`, the callback will
-- have no effect since the js side tries to call it like so
--    ((str) -> () -> { ... })()
onChange
  :: forall a
   . (a -> Effect Unit)
  -> (Controller a)
  -> Effect (Controller a)
onChange cb = runEffectFn2 onChangeImpl (mkEffectFn1 cb)

foreign import create :: Effect GUI
foreign import addImpl
  :: forall a b props. EffectFn4 String { | props } (Controls a) GUI (Controller b)

foreign import addColorImpl
  :: forall a props. EffectFn3 String { | props } GUI (Controller a)

foreign import addFolderImpl :: EffectFn2 String GUI GUI
foreign import openImpl :: EffectFn1 GUI GUI
foreign import closeImpl :: EffectFn1 GUI GUI
foreign import nameImpl
  :: forall a. EffectFn2 String (Controller a) (Controller a)

foreign import onChangeImpl
  :: forall a. EffectFn2 (EffectFn1 a Unit) (Controller a) (Controller a)

