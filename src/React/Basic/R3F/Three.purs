-- | Low level three.js bindings
module React.Basic.R3F.Three where

import Prelude

import Data.Enum (class BoundedEnum, class Enum, Cardinality(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Effect.Unsafe (unsafePerformEffect)
import Prim.Row (class Union)
import React.Basic (ReactComponent)
import React.Basic.DOM (unsafeCreateDOMComponent)

foreign import data Vector2 :: Type
foreign import data Vector3 :: Type
foreign import data Clock :: Type
foreign import data Color :: Type
foreign import data Scene :: Type
foreign import data Fog :: Type

getElapsedTime :: Clock -> Effect Number
getElapsedTime = runEffectFn1 getElapsedTimeImpl

createColor :: String -> Effect Color
createColor = runEffectFn1 createColorImpl

createScene :: Effect Scene
createScene = createSceneImpl

type Props_fog = (color :: String, near :: Number, far :: Number)

createFog
  :: forall props props_
   . Union props props_ Props_fog
  => { | props }
  -> Effect Fog
createFog = runEffectFn1 createFogImpl

foreign import getElapsedTimeImpl :: EffectFn1 Clock Number
foreign import createColorImpl :: EffectFn1 String Color
foreign import createSceneImpl :: Effect Scene
foreign import createFogImpl :: forall props. EffectFn1 { | props } Fog

-- =======================================
-- ==             Renderers             ==
-- =======================================

foreign import data WebGLRenderer :: Type

-- =======================================
-- ==             Materials             ==
-- =======================================

foreign import data Material :: Type
foreign import meshNormalMaterial :: Effect Material

-- =======================================
-- ==             Constants             ==
-- =======================================

-- | Texture mapping modes
data MappingMode
  = UVMapping
  | CubeReflectionMapping
  | CubeRefractionMapping
  | EquirectangularReflectionMapping
  | EquirectangularRefractionMapping
  | CubeUVReflectionMapping

derive instance eqMappingMode :: Eq MappingMode
derive instance ordMappingMode :: Ord MappingMode

instance enumMappingMode :: Enum MappingMode where
  succ UVMapping = Just CubeReflectionMapping
  succ CubeReflectionMapping = Just CubeRefractionMapping
  succ CubeRefractionMapping = Just EquirectangularReflectionMapping
  succ EquirectangularReflectionMapping = Just EquirectangularRefractionMapping
  succ EquirectangularRefractionMapping = Just CubeUVReflectionMapping
  succ CubeUVReflectionMapping = Nothing
  pred CubeUVReflectionMapping = Just EquirectangularRefractionMapping
  pred EquirectangularRefractionMapping = Just EquirectangularReflectionMapping
  pred EquirectangularReflectionMapping = Just CubeRefractionMapping
  pred CubeRefractionMapping = Just CubeReflectionMapping
  pred CubeReflectionMapping = Just UVMapping
  pred UVMapping = Nothing

instance boundedMappingMode :: Bounded MappingMode where
  top = CubeUVReflectionMapping
  bottom = UVMapping

instance boundedEnumMappingMode :: BoundedEnum MappingMode where
  cardinality = Cardinality 6
  toEnum 300 = Just UVMapping
  toEnum 301 = Just CubeReflectionMapping
  toEnum 302 = Just CubeRefractionMapping
  toEnum 303 = Just EquirectangularReflectionMapping
  toEnum 304 = Just EquirectangularRefractionMapping
  toEnum 306 = Just CubeUVReflectionMapping
  toEnum _ = Nothing
  fromEnum UVMapping = 300
  fromEnum CubeReflectionMapping = 301
  fromEnum CubeRefractionMapping = 302
  fromEnum EquirectangularReflectionMapping = 303
  fromEnum EquirectangularRefractionMapping = 304
  fromEnum CubeUVReflectionMapping = 306

-- | Shadow map type
data ShadowMapType
  = BasicShadowMap
  | PCFShadowMap
  | PCFSoftShadowMap
  | VSMShadowMap

derive instance eqShadowMapType :: Eq ShadowMapType
derive instance ordShadowMapType :: Ord ShadowMapType

instance enumShadowMapType :: Enum ShadowMapType where
  succ BasicShadowMap = Just PCFShadowMap
  succ PCFShadowMap = Just PCFSoftShadowMap
  succ PCFSoftShadowMap = Just VSMShadowMap
  succ VSMShadowMap = Nothing
  pred VSMShadowMap = Just PCFSoftShadowMap
  pred PCFSoftShadowMap = Just PCFShadowMap
  pred PCFShadowMap = Just BasicShadowMap
  pred BasicShadowMap = Nothing

instance boundedShadowMapType :: Bounded ShadowMapType where
  top = VSMShadowMap
  bottom = BasicShadowMap

instance boundedEnumShadowMapType :: BoundedEnum ShadowMapType where
  cardinality = Cardinality 4
  toEnum 0 = Just BasicShadowMap
  toEnum 1 = Just PCFShadowMap
  toEnum 2 = Just PCFSoftShadowMap
  toEnum 3 = Just VSMShadowMap
  toEnum _ = Nothing
  fromEnum BasicShadowMap = 0
  fromEnum PCFShadowMap = 1
  fromEnum PCFSoftShadowMap = 2
  fromEnum VSMShadowMap = 3

threejs :: forall props. String -> ReactComponent { | props }
threejs = unsafePerformEffect <<< unsafeCreateDOMComponent

