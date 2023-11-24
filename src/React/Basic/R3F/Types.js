export const getElapsedTime = (clock) => {
  return clock.getElapsedTime()
}

export const setPosition = (el, f) => {
  const pos = el.current.position
  el.current.position.set(...f(...pos))
  return
}

export const setRotation = (el, f) => {
  const angle = el.current.rotation
  el.current.rotation.set(...f(...angle))
  return
}

