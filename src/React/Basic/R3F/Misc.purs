module React.Basic.R3F.Misc
  ( createFog
  , createScene
  , Props_fog
  , Scene
  , Fog
  , stats
  , group
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
foreign import createFogImpl :: forall props. EffectFn1 (Record props) Fog

createFog
  :: forall props props_
   . Union props props_ Props_fog
  => (Record props)
  -> Effect Fog
createFog = runEffectFn1 createFogImpl

group
  :: forall props
   . Record props
  -> JSX
group = element (threejs "Group")

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

foreign import statsImpl :: forall props. ReactComponent { | props }

