export const flattenMeshArgs = (args) => {
  return [ args.geometry, args.material ]
}

export const flattenInstancedMeshArgs = (args) => {
  return [ args.geometry, args.material, args.count ]
}

export const instancedMeshSetMatrixAt = (mesh, ix, matrix) => {
  mesh.setMatrixAt(ix, matrix)
  return
}

export const refSetMatrixAt = (ref, ix, matrix) => {
  instancedMeshSetMatrixAt(ref.current, ix, matrix)
}

