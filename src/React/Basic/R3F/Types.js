export const getElapsedTime = (clock) => {
  return clock.getElapsedTime()
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

export const addImpl = (parent, child) => {
  parent.add(child)
  return
}

export const setPositionByRefImpl = (el, f) => {
  return setPositionImpl(el.current, f)
}

export const setRotationByRefImpl = (el, f) => {
  return setRotationImpl(el.current, f)
}

export const addByRefImpl = (parent, child) => {
  return addImpl(parent.current, child)
}

