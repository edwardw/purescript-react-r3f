export const flattenBoxArgs = (args) => {
  return [
    args.width,
    args.height,
    args.depth,
    args.widthSegments,
    args.heightSegments,
    args.depthSegments,
  ]
}

export const flattenPlaneArgs = (args) => {
  return [
    args.width,
    args.height,
    args.widthSegments,
    args.heightSegments,
  ]
}

export const flattenTorusKnotArgs = (args) => {
  return [
    args.radius,
    args.tube,
    args.tubularSegments,
    args.radialSegments,
    args.p,
    args.q,
  ]
}

export const flattenSphereArgs = (args) => {
  return [
    args.radius,
    args.widthSegments,
    args.heightSegments,
    args.phiStart,
    args.phiLength,
    args.thetaStart,
    args.thetaLength,
  ]
}

