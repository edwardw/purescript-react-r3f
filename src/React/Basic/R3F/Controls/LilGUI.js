import GUI from "lil-gui"

export const create = () => { return new GUI() }

export const openImpl = (gui) => {
  return gui.open()
}

export const closeImpl = (gui) => {
  return gui.close()
}

export const addImpl = (prop, obj, val, gui) => {
  return gui.add(obj, prop, ...(Object.values(val)))
}

export const addFolderImpl = (title, gui) => {
  return gui.addFolder(title)
}

export const nameImpl = (name, controller) => {
  return controller.name(name)
}

export const onChangeImpl = (cb, controller) => {
  return controller.onChange(cb)
}

