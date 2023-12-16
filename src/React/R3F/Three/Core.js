import * as Three from "three"

export const object3DUpdateMatrix = (obj) => {
  obj.updateMatrix()
  return
}

export const object3DMatrix = (obj) => {
  return obj.matrix
}

export const setPositionImpl = (el, f) => {
  const pos = el.position
  el.position.set(...f(...pos))
  return
}

export const setRotationImpl = (el, f) => {
  const angle = el.rotation
  el.rotation.set(...f(...angle))
  return
}

export const bufferGeoGetIndex = (geo) => {
  return geo.index
}

export const bufferGeoGetAttribute = (geo, name) => {
  return geo.getAttribute(name)
}

export const bufferGeoSetAttribute = (geo, name, attr) => {
  geo.setAttribute(name, attr)
  return
}

export const bufferGeoTranslate = (geo, x, y, z) => {
  geo.translate(x, y, z)
  return
}

export const bufferGeoLookAt = (geo, vector3) => {
  geo.lookAt(vector3)
  return
}

export const clockGetElapsedTime = (clock) => {
  return clock.getElapsedTime()
}

export const flattenInstancedBAArgs = (args) => {
  return [ args.array, args.itemSize, args.normalized, args.meshPerAttribute ]
}

