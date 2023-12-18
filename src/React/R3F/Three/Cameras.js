export const flattenOrthographicCameraArgs = (args) => {
  return [
    args.left,
    args.right,
    args.top,
    args.bottom,
    args.near,
    args.far,
  ]
}

