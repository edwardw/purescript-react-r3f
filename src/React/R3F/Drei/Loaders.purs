module React.R3F.Drei.Loaders where

import Prelude

import Effect.Uncurried (EffectFn1, runEffectFn1)
import Prim.RowList (class RowToList)
import React.Basic.Hooks (Hook, unsafeHook)
import React.R3F.Three.Types (Texture)
import Record.Extra (class MapRecord)

useTexture :: forall hooks. String -> Hook (UseLoader hooks) Texture
useTexture = unsafeHook <<< runEffectFn1 useTextureImpl

-- | Load multiple textures at once.
-- |
-- | The type signature of the function dictates that given an uniform record of
-- | all string arguments, it will return a record of the same shape but with
-- | all texture results.
-- |
-- | E.g., in physically based rendering (PBR) maps, there are several maps that
-- | serve different purposes, such as color map, normal map, displacement map,
-- | etc. To load them:
-- | ```purescript
-- |  textures <- useTextures
-- |    { colorMap: "path/to/color_map_file"
-- |    , normalMap: "..."
-- |    , displacementMap: "..."
-- |    , aoMap: "..."
-- |    , roughnessMap: "..."
-- |    , metalicMap: "..."
-- |    }
-- | ```
-- | Then the result `textures` will be a record of the type:
-- | ```purescript
-- |    { colorMap :: Texture
-- |    , normalMap :: Texture
-- |    , displacementMap :: Texture
-- |    , aoMap :: Texture
-- |    , roughnessMap :: Texture
-- |    , metalicMap :: Texture
-- |    }
-- | ```
useTextures
  :: forall rl ins outs hooks
   . RowToList ins rl
  => MapRecord rl ins String Texture () outs
  => { | ins }
  -> Hook (UseLoader hooks) { | outs }
useTextures = unsafeHook <<< runEffectFn1 useTexturesImpl

-- | A GLTF loader hook.
-- |
-- | The type is very liberal for now. A recommended and probably easier way to
-- | work with GLTFs is to use the tool `gltfjsx`, which converts and optionally
-- | compresses the models. It also generates a jsx import file such as:
-- |
-- | ```
-- |  export function Model(props) {
-- |    const { nodes, materials } = useGLTF('/path/to/glb-file')
-- |    return (
-- |      <group {...props} dispose={null}>
-- |        <mesh geometry={nodes.Object_4.geometry} material={materials['name1']} ... />
-- |        <mesh geometry={nodes.Object_5.geometry} material={materials['name2']} ... />
-- |        <... more meshes>
-- |      </group>
-- |    )
-- |  }
-- | ```
-- |
-- | which can roughly be translated to:
-- |
-- | ```
-- |  { nodes } <- useGLTF "/path/to/glb-file"
-- |  pure $ R3F.group
-- |    { children:
-- |        [ R3F.mesh nodes."Object_4"
-- |        , R3F.mesh nodes."Object_5"
-- |        , ...
-- |        ]
-- |    }
-- | ```
useGLTF :: forall hooks a. String -> Hook (UseLoader hooks) a
useGLTF = unsafeHook <<< runEffectFn1 useGLTFImpl

-- | To preload the GLTF asset.
preloadGLTF :: forall hooks. String -> Hook (UseLoader hooks) Unit
preloadGLTF = unsafeHook <<< runEffectFn1 preloadGLTFImpl

-- | An environment map loader.
-- |
-- | Usually in `hdr` or `exr` format.
useEnvironment :: forall hooks. String -> Hook (UseLoader hooks) Texture
useEnvironment file = unsafeHook $ runEffectFn1 useEnvImpl { files: file }

foreign import data UseLoader :: Type -> Type -> Type

foreign import useTextureImpl :: EffectFn1 String Texture
foreign import useTexturesImpl :: forall a b. EffectFn1 { | a } { | b }
foreign import useGLTFImpl :: forall a. EffectFn1 String a
foreign import preloadGLTFImpl :: EffectFn1 String Unit
foreign import useEnvImpl :: forall props. EffectFn1 { | props } Texture

