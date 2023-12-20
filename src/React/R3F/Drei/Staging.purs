module React.R3F.Drei.Staging where

import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent, Ref, element)
import React.R3F.Three.Types (Color, Scene, Texture)
import Type.Row (type (+))
import Untagged.Union (type (|+|))

stage
  :: forall props
   . { | props }
  -> JSX
stage = element stageImpl

sky
  :: forall props
   . { | props }
  -> JSX
sky = element skyImpl

-- | A component that makes its contents float or hover.
float
  :: forall props
   . { | props }
  -> JSX
float = element floatImpl

type EnvironmentLoaderProps r =
  ( files :: String |+| Array String
  , path :: String
  , preset :: String
  | r
  )

type EnvironMentProps =
  ( children :: Array JSX
  , frames :: Int
  , near :: Number
  , far :: Number
  , resolution :: Int
  , background :: Boolean |+| String
  , blur :: Number
  , map :: Texture
  , preset :: String
  , scene :: Scene |+| Ref JSX
  , ground :: Boolean |+| { radius :: Number, height :: Number, scale :: Number }
  )

-- | Sets up a global cubemap.
-- |
-- | A selection of presets from [HDRI Haven](https://hdrihaven.com/) are
-- | available, currently:
-- |  - apartment
-- |  - city
-- |  - dawn
-- |  - forest
-- |  - lobby
-- |  - night
-- |  - park
-- |  - studio
-- |  - sunset
-- |  - warehouse
environment
  :: forall props props_
   . Union props props_ (EnvironmentLoaderProps + EnvironMentProps)
  => { | props }
  -> JSX
environment = element environmentImpl

type ContactShadowsProps =
  ( opacity :: Number
  , width :: Number
  , height :: Number
  , blur :: Number
  , near :: Number
  , far :: Number
  , smooth :: Boolean
  , resolution :: Int
  , frames :: Int
  , scale :: Number |+| Array Number
  , color :: Color
  , depthWrite :: Boolean
  , position :: Array Number -- temporarily, should really be GroupProps
  )

-- | Implements contact shadow.
-- |
-- | It faces upwards (positive Y value) by default.
-- |
-- | This is a rather expensive effect, one can limit the amount of frames it
-- | renders when objects are static. E.g., making it render only once:
-- | ```purescript
-- |  contactShadows { frames: 1 }
-- | ```
contactShadows
  :: forall props props_
   . Union props props_ ContactShadowsProps
  => { | props }
  -> JSX
contactShadows = element contactShadowsImpl

foreign import stageImpl :: forall props. ReactComponent { | props }
foreign import skyImpl :: forall props. ReactComponent { | props }
foreign import floatImpl :: forall props. ReactComponent { | props }
foreign import environmentImpl :: forall props. ReactComponent { | props }
foreign import contactShadowsImpl :: forall props. ReactComponent { | props }

