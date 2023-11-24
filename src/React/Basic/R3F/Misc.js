import * as R3D from "@react-three/drei"
import * as THREE from "three"

export const statsImpl = R3D.Stats

export const createFog = (props) => {
  return new THREE.Fog(...Object.values(props))
}

export const createScene = (fog) => {
  const scene = new THREE.Scene()
  scene.fog = fog
  return scene
}

