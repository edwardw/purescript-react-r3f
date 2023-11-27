export const getElapsedTime = (clock) => {
  return clock.getElapsedTime()
}

export const setPositionImpl = (el, f) => {
  const pos = el.current.position
  el.current.position.set(...f(...pos))
  return
}

export const setRotationImpl = (el, f) => {
  const angle = el.current.rotation
  el.current.rotation.set(...f(...angle))
  return
}

export const addImpl = (parent, child) => {
  parent.current.add(child)
  return
}

