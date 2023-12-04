/**
 * Most three.js components' constructors have arguments. In react-three/fiber
 * world, the arguments are passed through an array property names `args`, e.g.
 *    <gridHelper args={[10, 10]} />
 *
 * It feels very verbose if translated directly into purescript:
 *    gridHelper { args: [ 10, 10 ] }
 * It is also order sensitive. Not to mention that it is outright impossible for
 * heterogeneous arguments.
 *
 * What being experimented here is to make the arguments passing explicit, so
 * that the user can instantiate a component like so:
 *    gridhelper
 *      { size: 10, divisions: 10, colorCenterLine: "green" }
 *      { ...additional properties }
 * with the convenience of specifying the arguments out of order and omitting
 * some as one sees fit.
 */
import React from "react"

export const elementImpl = (component, f, args, props) => {
  const argArray = f(args)
  return React.createElement(component, { args: argArray, ...props})
}

