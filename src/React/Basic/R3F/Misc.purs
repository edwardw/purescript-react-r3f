module React.Basic.R3F.Misc
  ( createFog
  , createScene
  , Scene
  , Fog
  , Props_fog
  , stats
  , group
  , Null
  , null
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Effect.Unsafe (unsafePerformEffect)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (unsafeCreateDOMComponent)

stats :: JSX
stats = element statsImpl {}

type Props_fog = (color :: String, near :: Number, far :: Number)

foreign import data Scene :: Type
foreign import data Fog :: Type

foreign import createScene :: Effect Scene
foreign import createFogImpl :: forall props. EffectFn1 { | props } Fog

createFog
  :: forall props props_
   . Union props props_ Props_fog
  => { | props }
  -> Effect Fog
createFog = runEffectFn1 createFogImpl

group
  :: forall props
   . { | props }
  -> JSX
group = element (threejs "Group")

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import statsImpl :: forall props. ReactComponent { | props }

-- purescript-literals has it, but seems to have bundling errors.
foreign import data Null :: Type
foreign import nullImpl :: Null

null :: Null
null = nullImpl

