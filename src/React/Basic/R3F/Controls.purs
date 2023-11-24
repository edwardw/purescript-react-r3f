module React.Basic.R3F.Controls
  ( orbitControls
  , LilGUI
  , lilGUICreate
  , lilGUIAdd
  , LilGUIProperty(..)
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn4, runEffectFn4)
import React.Basic (JSX, ReactComponent, element)

foreign import orbitControlsImpl :: forall props. ReactComponent { | props }

orbitControls
  :: forall props
   . Record props
  -> JSX
orbitControls = element orbitControlsImpl

-- | The lil-gui component
-- |
-- | It is not a `@react-three/fiber` component and will be rendered outside the
-- | `@react-three/fiber` root canvas. Creating one is enough for a gui to show
-- | up.
foreign import data LilGUI :: Type

data LilGUIProperty a
  = Checkbox
  | TextField String
  | NumberField Number Number Number
  | Button (Effect Unit)
  | Dropdown (Array a)

foreign import lilGUICreate :: Effect LilGUI
foreign import lilGUIAddImpl
  :: forall a props. EffectFn4 LilGUI { | props } String (LilGUIProperty a) Unit

-- How to express "there should be a field named the thrid argument, which is a
-- String, in the `Reocrd props`"?
lilGUIAdd
  :: forall a props
   . LilGUI
  -> Record props
  -> String
  -> LilGUIProperty a
  -> Effect Unit
lilGUIAdd = runEffectFn4 lilGUIAddImpl

