import * as Three from "three"

export const createObject3D = () => {
  return new Three.Object3D()
}

export const createMatrix4Impl = (args) => {
  return new Three.Matrix4(...args)
}

export const createVector3Impl = (args) => {
  return new Three.Vector3(...args)
}

