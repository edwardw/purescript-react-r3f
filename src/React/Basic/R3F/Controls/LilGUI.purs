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
foreign import data Controller :: Type

data Controls a
  = Checkbox
  | TextField String
  | NumberField Number Number Number
  | Button
  | Dropdown (Array a)

add
  :: forall @prop v props_ props a
   . IsSymbol prop
  => Cons prop v props_ props
  => { | props }
  -> (Controls a)
  -> GUI
  -> Effect Controller
add = runEffectFn4 addImpl (reflectSymbol (Proxy :: _ prop))

addColor
  :: forall @prop v props_ props
   . IsSymbol prop
  => Cons prop v props_ props
  => { | props }
  -> GUI
  -> Effect Controller
addColor = runEffectFn3 addColorImpl (reflectSymbol (Proxy :: _ prop))

addFolder :: String -> GUI -> Effect GUI
addFolder = runEffectFn2 addFolderImpl

open :: GUI -> Effect GUI
open = runEffectFn1 openImpl

close :: GUI -> Effect GUI
close = runEffectFn1 closeImpl

name :: String -> Controller -> Effect Controller
name = runEffectFn2 nameImpl

-- Subtle: `onChangeImpl` has a callback of signature
--    EffectFn1 String Unit
-- and `onChange`
--    String -> Effect Unit
-- If passing the curried version directly to `onChangeImpl`, the callback will
-- have no effect since the js side tries to call it like so
--    ((str) -> () -> { ... })()
onChange :: (String -> Effect Unit) -> Controller -> Effect Controller
onChange cb = runEffectFn2 onChangeImpl (mkEffectFn1 cb)

foreign import create :: Effect GUI
foreign import addImpl
  :: forall a props. EffectFn4 String { | props } (Controls a) GUI Controller

foreign import addColorImpl
  :: forall props. EffectFn3 String { | props } GUI Controller

foreign import addFolderImpl :: EffectFn2 String GUI GUI
foreign import openImpl :: EffectFn1 GUI GUI
foreign import closeImpl :: EffectFn1 GUI GUI
foreign import nameImpl :: EffectFn2 String Controller Controller
foreign import onChangeImpl :: EffectFn2 (EffectFn1 String Unit) Controller Controller

