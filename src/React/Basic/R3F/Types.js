export const getElapsedTime = (clock) => {
  return clock.getElapsedTime()
}

export const setPosition = (el, pos) => {
  el.current.position.set(...pos)
  return
}

export const setRotation = (el, ro) => {
  el.current.rotation.set(...ro)
  return
}

