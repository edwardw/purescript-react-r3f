import { useFrame, applyProps } from "@react-three/fiber"

export const useFrameImpl = useFrame
export const applyRefPropsImpl = (ref, props) => {
  applyProps(ref.current, props)
  return
}

