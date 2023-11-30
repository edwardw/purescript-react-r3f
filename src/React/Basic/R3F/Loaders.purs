module React.Basic.R3F.Loaders
  ( Texture
  , UseLoader
  , useTexture
  , MappingMode(..)
  ) where

import Prelude

import Data.Enum (class BoundedEnum, class Enum, Cardinality(..))
import Data.Maybe (Maybe(..))
import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.Basic.Hooks (Hook, unsafeHook)

foreign import data Texture :: Type

foreign import data UseLoader :: Type -> Type -> Type

useTexture :: forall a. String -> Hook (UseLoader a) Texture
useTexture = unsafeHook <<< runEffectFn1 useTextureImpl

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

foreign import useTextureImpl :: EffectFn1 String Texture

