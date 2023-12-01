import * as Three from "three"

export const createFogImpl = (props) => {
  // Instead of using `Object.values(props)`, spell out the order of props to
  // accommodate purescript record. Different record updating methods on the
  // purescript side, such as record update syntax, `Record.set` etc. may or may
  // not preserve the field order of input record, which leads to very subtle
  // bugs.
  const args = [ props.color, props.near, props.far ]
  return new Three.Fog(...args)
}

export const createSceneImpl = () => {
  const scene = new Three.Scene()
  return scene
}

export const getElapsedTimeImpl = (clock) => {
  return clock.getElapsedTime()
}

export const createColorImpl = (color) => {
  return new Three.Color(color)
}

export const meshNormalMaterial = () => {
  return new Three.MeshNormalMaterial()
}

