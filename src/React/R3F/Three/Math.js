import * as Three from "three"

export const matrix4Clone = (matrix) => {
  return matrix.clone()
}

export const srgb2Linear = (color) => {
  color.convertSRGBToLinear()
  return
}

export const vector4Impl = (function(x, y, z, w) {
  let Vector4 = function (x, y, z, w) {
    this.vector = new Three.Vector4(x, y, z, w)
  }

  Vector4.prototype.x = function () {
    return this.vector.x
  }

  Vector4.prototype.y = function () {
    return this.vector.y
  }

  Vector4.prototype.z = function () {
    return this.vector.z
  }

  Vector4.prototype.w = function () {
    return this.vector.w
  }

  Vector4.prototype.set = function (x, y, z, w) {
    this.vector.set(x, y, z, w)
  }

  Vector4.prototype.normalize = function () {
    this.vector.normalize()
  }

  return function(x, y, z, w) {
    return new Vector4(x, y, z, w)
  }
})()

