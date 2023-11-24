module React.Basic.R3F.Misc
  ( createFog
  , createScene
  , Props_fog
  , Scene
  , Fog
  , stats
  ) where

import Effect.Uncurried (EffectFn1)
import React.Basic (JSX, ReactComponent, element)

foreign import statsImpl :: forall props. ReactComponent { | props }

stats :: JSX
stats = element statsImpl {}

type Props_fog = (color :: String, near :: Number, far :: Number)

foreign import data Scene :: Type
foreign import data Fog :: Type

foreign import createFog :: EffectFn1 (Record Props_fog) Fog
foreign import createScene :: EffectFn1 Fog Scene

