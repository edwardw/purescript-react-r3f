module React.R3F.Three.Constants where

-- ===========================================================================
-- Material Constants
-- ===========================================================================

data Side

foreign import frontSide :: Side
foreign import backSide :: Side
foreign import doubleSide :: Side

data BlendingMode

foreign import noBlending :: BlendingMode
foreign import normalBlending :: BlendingMode
foreign import additiveBlending :: BlendingMode
foreign import subtractiveBlending :: BlendingMode
foreign import multiplyBlending :: BlendingMode
foreign import customBlending :: BlendingMode

data DepthMode

foreign import neverDepth :: DepthMode
foreign import alwaysDepth :: DepthMode
foreign import equalDepth :: DepthMode
foreign import lessDepth :: DepthMode
foreign import lessEqualDepth :: DepthMode
foreign import greaterEqualDepth :: DepthMode
foreign import greaterDepth :: DepthMode
foreign import notEqualDepth :: DepthMode

data StencilFunctions

foreign import neverStencilFunc :: StencilFunctions
foreign import lessStencilFunc :: StencilFunctions
foreign import equalStencilFunc :: StencilFunctions
foreign import lessEqualStencilFunc :: StencilFunctions
foreign import greaterStencilFunc :: StencilFunctions
foreign import notEqualStencilFunc :: StencilFunctions
foreign import greaterEqualStencilFunc :: StencilFunctions
foreign import alwaysStencilFunc :: StencilFunctions

data StencilOperations

foreign import zeroStencilOp :: StencilOperations
foreign import keepStencilOp :: StencilOperations
foreign import replaceStencilOp :: StencilOperations
foreign import incrementStencilOp :: StencilOperations
foreign import decrementStencilOp :: StencilOperations
foreign import incrementWrapStencilOp :: StencilOperations
foreign import decrementWrapStencilOp :: StencilOperations
foreign import invertStencilOp :: StencilOperations

data TextureCombineOperations

foreign import multiplyOperation :: TextureCombineOperations
foreign import mixOperation :: TextureCombineOperations
foreign import addOperation :: TextureCombineOperations

data NormalMapType

foreign import tangentSpaceNormalMap :: NormalMapType
foreign import objectSpaceNormalMap :: NormalMapType

-- ===========================================================================
-- Custom Blending Equation Constants
-- ===========================================================================

data BlendingEquations

foreign import addEquation :: BlendingEquations
foreign import subtractEquation :: BlendingEquations
foreign import reverseSubtractEquation :: BlendingEquations
foreign import minEquation :: BlendingEquations
foreign import maxEquation :: BlendingEquations

data SourceFactors

foreign import zeroFactor :: SourceFactors
foreign import oneFactor :: SourceFactors
foreign import srcColorFactor :: SourceFactors
foreign import oneMinusSrcColorFactor :: SourceFactors
foreign import srcAlphaFactor :: SourceFactors
foreign import oneMinusSrcAlphaFactor :: SourceFactors
foreign import dstAlphaFactor :: SourceFactors
foreign import oneMinusDstAlphaFactor :: SourceFactors
foreign import dstColorFactor :: SourceFactors
foreign import oneMinusDstColorFactor :: SourceFactors
foreign import srcAlphaSaturateFactor :: SourceFactors
foreign import constantColorFactor :: SourceFactors
foreign import oneMinusConstantColorFactor :: SourceFactors
foreign import constantAlphaFactor :: SourceFactors
foreign import oneMinusConstantAlphaFactor :: SourceFactors

