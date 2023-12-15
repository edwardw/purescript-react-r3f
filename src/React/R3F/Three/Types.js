import * as Three from "three"

export const createObject3D = () => {
  return new Three.Object3D()
}

export const createMatrix4Impl = (args) => {
  return new Three.Matrix4(...args)
}

export const createColorImpl = (args) => {
  return new Three.Color(args)
}

export const createVector3Impl = (args) => {
  return new Three.Vector3(...args)
}

export const createFogImpl = (props) => {
  // Instead of using `Object.values(props)`, spell out the order of props to
  // accommodate purescript record. Different record updating methods on the
  // purescript side, such as record update syntax, `Record.set` etc. may or may
  // not preserve the field order of input record, which leads to very subtle
  // bugs.
  const args = [ props.color, props.near, props.far ]
  return new Three.Fog(...args)
}

export const meshNormalMaterial = () => {
  return new Three.MeshNormalMaterial()
}

