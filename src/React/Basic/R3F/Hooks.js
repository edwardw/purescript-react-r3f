import { useFrame, useThree, applyProps } from "@react-three/fiber"

export const useFrameImpl = useFrame
export const useThreeImpl = useThree

export const applyPropsImpl = applyProps

export const applyRefPropsImpl = (ref, props) => {
  applyProps(ref.current, props)
  return
}

