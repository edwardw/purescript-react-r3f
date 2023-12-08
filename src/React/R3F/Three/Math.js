import * as Three from "three"

export const createColorImpl = (args) => {
  return new Three.Color(args)
}

export const matrix4Clone = (matrix) => {
  return matrix.clone()
}

