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
 * What being experimented here is basically `React.Basic.element` and
 * `React.Basic.DOM.unsafeCreateDOMComponent` rolled into one, so that the user
 * can instantiate a component like so:
 *    gridhelper
 *      { size: 10, divisions: 10, colorCenterLine: "green" }
 *      { ...additional properties }
 * with the convenience of specifying the arguments in any order and ignoring
 * some as one sees fit.
 */
import React from "react"
import { useHelper } from "@react-three/drei"
import * as Three from "three"

export const gridHelperImpl = (args) => (props) => () => {
  const args_ = [
    args.size,
    args.divisions,
    args.colorCenterLine,
    args.colorGrid
  ]

  return threeToJSX("GridHelper", args_, props)
}

export const polarGridHelperImpl = (args) => (props) => () => {
  const args_ = [
    args.radius,
    args.sectors,
    args.rings,
    args.divisions,
    args.color1,
    args.color2
  ]

  return threeToJSX("PolarGridHelper", args_, props)
}

export const useCameraHelperImpl = (props) => {
  useHelper(props.camera, Three.CameraHelper)
  return
}

export function threeToJSX(name, args, props) {
  const c = createComponent(name)
  return element(c)({ args: args, ...props })
}

function createComponent(el) {
  const c = React.forwardRef((props, ref) =>
    element(el)(Object.assign({ ref }, props))
  )
  c.displayName = el
  return c
}

function element(component) {
  return (props) =>
    React.createElement(component, props)
}

