import { useFrame, useThree, applyProps } from "@react-three/fiber"
import * as Three from "three"

export const useFrameImpl = useFrame
export const useThreeImpl = useThree

export const applyPropsImpl = applyProps

export const applyRefPropsImpl = (ref, props) => {
  applyProps(ref.current, props)
  return
}

export const applyScenePropsImpl = (scene, props) => {
  applyProps(scene, props)

  // The texture is special-cased in applyProps implementation, which may not be
  // what we want. So set it directly.
  if (props.background instanceof Three.Texture) {
    scene.background = props.background
  }
}

