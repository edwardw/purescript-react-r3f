import { useFrame, useThree, applyProps, invalidate } from "@react-three/fiber"

export const useFrameImpl = useFrame
export const useThreeImpl = useThree

export const applyPropsImpl = applyProps

export const applyRefPropsImpl = (ref, props) => {
  applyProps(ref.current, props)
  return
}

export const invalidateImpl = invalidate

