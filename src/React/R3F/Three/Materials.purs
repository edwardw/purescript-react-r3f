module React.R3F.Three.Materials where

import Prim.Row (class Union)
import React.Basic (JSX)
import React.R3F.Three.Constants (BlendingEquations, BlendingMode, DepthMode, NormalMapType, Side, SourceFactors, StencilFunctions, StencilOperations, TextureCombineOperations)
import React.R3F.Three.Internal (elementWithArgs, threejs)
import React.R3F.Three.Types (Color, Plane, Texture, Vector2)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)

type MaterialProps a b r =
  ( attach :: String
  , alphaHash :: Boolean
  , alphaTest :: Boolean
  , alphaToCoverage :: Boolean
  , blendAlpha :: Number
  , blendColor :: Color
  , blendDst :: SourceFactors
  , blendDstAlpha :: Int
  , blendEquation :: BlendingEquations
  , blendEquationAlpha :: Int
  , blending :: BlendingMode
  , blendSrc :: SourceFactors
  , blendSrcAlpha :: Int
  , clipIntersection :: Boolean
  , clippingPlanes :: Array Plane
  , clipShadows :: Boolean
  , colorWrite :: Boolean
  , defines :: { | a }
  , depthFunc :: DepthMode
  , depthTest :: Boolean
  , depthWrite :: Boolean
  , forceSinglePass :: Boolean
  , isMaterial :: Boolean
  , stencilWrite :: Boolean
  , stencilWriteMask :: Int
  , stencilFunc :: StencilFunctions
  , stencilRef :: Int
  , stencilFuncMask :: Int
  , stencilFail :: StencilOperations
  , stencilZFail :: StencilOperations
  , stencilZPass :: StencilOperations
  , id :: Int
  , name :: String
  , needsUpdate :: Boolean
  , opacity :: Number
  , polygonOffset :: Boolean
  , polygonOffsetFactor :: Int
  , polygonOffsetUnits :: Int
  , precision :: String
  , premultipliedAlpha :: Boolean
  , dithering :: Boolean
  , shadowSide :: Side
  , side :: Side
  , toneMapped :: Boolean
  , transparent :: Boolean
  , "type" :: String
  , uuid :: String
  , version :: Int
  , vertexColors :: Boolean
  , visible :: Boolean
  , userData :: { | b }
  | r
  )

type MeshLambertMaterialProps a b =
  ( alphaMap :: Texture
  , aoMap :: Texture
  , aoMapIntensity :: Number
  , bumpMap :: Texture
  , bumpScale :: Number
  , color :: Color
  , combine :: TextureCombineOperations
  , displacementMap :: Texture
  , displacementScale :: Number
  , displacementBias :: Number
  , emissive :: Color
  , emissiveMap :: Texture
  , emissiveIntensity :: Number
  , envMap :: Texture
  , flatShading :: Boolean
  , fog :: Boolean
  , lightMap :: Texture
  , lightMapIntensity :: Number
  , map :: Texture
  , normalMap :: Texture
  , normalMapType :: NormalMapType
  , normalScale :: Vector2
  , reflectivity :: Number
  , refractionRatio :: Number
  , specularMap :: Texture
  , wireframe :: Boolean
  , wireframeLinecap :: String
  , wireframeLinejoin :: String
  , wireframeLinewidth :: Number
  | (MaterialProps a b) + ()
  )

-- | A material for non-shiny surfaces.
-- |
-- | [Reference](https://threejs.org/docs/#api/en/materials/MeshLambertMaterial)
meshLambertMaterial
  :: forall a b args args_ props props_
   . Union args args_ (MeshLambertMaterialProps a b)
  => Union props props_ (MeshLambertMaterialProps a b)
  => { | args }
  -> { | props }
  -> JSX
meshLambertMaterial =
  elementWithArgs (threejs "MeshLambertMaterial") \args -> [ unsafeCoerce args ]

