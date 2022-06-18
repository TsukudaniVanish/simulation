module Pendulum where
import Lib
import Graphics.Gloss
import Debug.Trace

type Place = (Float, Float, Float)
base = (0, 100)

showPen = simulate window white 100 initial pendulam nextPlace
  where
    initial = (200 * sin (0.2), 100 - 200 * cos (0.2), 0)
    pendulam :: Place -> Picture
    pendulam p =
      let
        (x, y, t) = p
      in pictures [line [base, (x, y)], translate x y $! circleSolid 10]
    nextPlace v t p =
      let
        (x, y, _t) = p
        delta = t
        m = 10
        l = 200
        g = 9.8
        omega = sqrt (m * g / l)
        theta = seq omega $ sin (omega * _t) + 0.2
        dv = seq omega $ omega * cos (omega * _t) * l
        dv_x = seq theta $ seq dv $ dv * sin (pi /2 - theta)
        dv_y = seq theta $ seq dv $ dv * cos (pi / 2 - theta)
        x' = seq delta $ seq dv_x $ (x + dv_x * delta)
        y' = seq delta $ seq dv_y $ (y + dv_y * delta)
      in -- trace (show t <> "\n" <> show delta <> "\n" <> show dv <> "\n" <> show (x', y')) $
        seq x' $ seq y' $ (x', y', _t + delta)
