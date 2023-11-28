import GUI from "lil-gui"

export const create = () => { return new GUI() }
export const addImpl = (prop, gui, obj, val) => {
  gui.add(obj, prop, ...(Object.values(val)))
}
export const addFolder = (gui, title) => {
  return gui.addFolder(title)
}

