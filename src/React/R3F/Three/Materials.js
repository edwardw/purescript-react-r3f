export const shaderMatUniforms = (mat) => {
  return mat.uniforms
}

export const shaderMatSetUniforms = (mat, name, value) => {
  // pass in and set the whole uniforms will not trigger an update
  //    mat.uniforms = uniforms
  // has to set the individual attribute value for that to happen
  mat.uniforms[name].value = value
  return
}

export const shaderMatUniformsByRef = (ref) => {
  return shaderMatUniforms(ref.current)
}

export const shaderMatSetUniformsByRef = (ref, name, value) => {
  return shaderMatSetUniforms(ref.current, name, value)
}

