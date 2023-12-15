import { useHelper } from "@react-three/drei"
import * as Three from "three"

export const flattenGridHelperArgs = (args) => {
  return [
    args.size,
    args.divisions,
    args.colorCenterLine,
    args.colorGrid
  ]
}

export const flattenPolarHelperArgs = (args) => {
  return [
    args.redius,
    args.sectors,
    args.rings,
    args.divisions,
    args.color1,
    args.color2
  ]
}

export const useCameraHelperImpl = (props) => {
  useHelper(props, Three.CameraHelper)
  return
}

