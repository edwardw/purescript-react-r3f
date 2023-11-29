import { useHelper } from "@react-three/drei"
import { useFrame, useThree, applyProps } from "@react-three/fiber"
import * as Three from "three"

export const useFrameImpl = useFrame
export const useThreeImpl = useThree

export const applyPropsImpl = applyProps

export const applyRefPropsImpl = (ref, props) => {
  applyProps(ref.current, props)
  return
}

export const useCameraHelperImpl = (props) => {
  useHelper(props.camera, Three.CameraHelper)
  return
}

