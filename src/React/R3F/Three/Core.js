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

export const flattenInstancedBAArgs = (args) => {
  return [ args.array, args.itemSize, args.normalized, args.meshPerAttribute ]
}

