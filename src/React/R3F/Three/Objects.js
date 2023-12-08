export const flattenMeshArgs = (args) => {
  return [ args.geometry, args.material ]
}

export const flattenInstancedMeshArgs = (args) => {
  return [ args.geometry, args.material, args.count ]
}

export const meshGetGeometry = (mesh) => {
  return mesh.geometry
}

export const refGetGeometry = (ref) => {
  return meshGetGeometry(ref.current)
}

export const meshSetGeometry = (mesh, geo) => {
  mesh.geometry = geo
  return
}

export const refSetGeometry = (ref, geo) => {
  return meshSetGeometry(ref.current, geo)
}

export const instancedMeshSetMatrixAt = (mesh, ix, matrix) => {
  mesh.setMatrixAt(ix, matrix)
  return
}

export const refSetMatrixAt = (ref, ix, matrix) => {
  return instancedMeshSetMatrixAt(ref.current, ix, matrix)
}

export const instancedMeshGetInstanceMatrix = (mesh) => {
  return mesh.instanceMatrix
}

export const refGetInstanceMatrix = (ref) => {
  return instancedMeshGetInstanceMatrix(ref.current)
}

