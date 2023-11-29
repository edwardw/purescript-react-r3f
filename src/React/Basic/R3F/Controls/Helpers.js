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

export const gridHelperImpl = (args) => (props) => () => {
  const args_ = {
    size: args.size,
    divisions: args.divisions,
    colorCenterLine: args.colorCenterLine,
    colorGrid: args.colorGrid,
  }

  return jsx("GridHelper", args_, props)
}

export const polarGridHelperImpl = (args) => (props) => () => {
  const args_ = {
    radius: args.radius,
    sectors: args.sectors,
    rings: args.rings,
    divisions: args.divisions,
    color1: args.color1,
    color2: args.color2,
  }

  return jsx("PolarGridHelper", args_, props)
}

function jsx(name, args, props) {
  const c = createComponent(name)
  return element(c)({ args: Object.values(args), ...props })
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

