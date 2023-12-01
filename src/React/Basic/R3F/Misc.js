import * as R3D from "@react-three/drei"
import * as Three from "three"

export const statsImpl = R3D.Stats

export const createFogImpl = (props) => {
  // Instead of using `Object.values(props)`, spell out the order of props to
  // accommodate purescript record. Different record updating methods on the
  // purescript side, such as record update syntax, `Record.set` etc. may or may
  // not preserve the field order of input record, which leads to very subtle
  // bugs.
  const args = [ props.color, props.near, props.far ]
  return new Three.Fog(...args)
}

export const createScene = () => {
  const scene = new Three.Scene()
  return scene
}

export const nullImpl = null

