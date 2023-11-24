import * as R3D from "@react-three/drei"
import GUI from "lil-gui"

export const orbitControlsImpl = R3D.OrbitControls

export const lilGUICreate = () => { return new GUI() }
export const lilGUIAddImpl = (gui, obj, name, val) => {
  gui.add(obj, name, ...(Object.values(val)))
}

