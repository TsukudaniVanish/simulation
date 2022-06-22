module Pendulum where
import Lib
import Graphics.Gloss
import Debug.Trace

type Place = (Float, Float, Float) -- theta ,v_theta, t
base = (0, 100)

showPen = simulate window white 100 initial pendulam nextPlace
  where
    m = 10
    l = 50
    g = 9.8
    initial = ( pi /  6, 0, 0)
    pendulam :: Place -> Picture
    pendulam p =
      let
        (theta, v_theta , t) = p
        x = l * sin theta
        y = 100 - l * cos theta
      in pictures [line [base, (x, y)], translate x y $! circleSolid 10]
    nextPlace v t p =
      let
        (theta, v_theta , _t) = p
        delta = t
        a_theta = - g * sin theta / l
        v_theta_delta = seq a_theta $ a_theta * delta
        v'_theta = seq v_theta_delta $ v_theta + v_theta_delta
        theta_delta = seq v_theta $ v_theta * delta
        theta' = seq theta_delta $ theta + theta_delta
      in -- trace (show t <> "\n" <> show delta <> "\n" <> show dv <> "\n" <> show (x', y')) $
        (theta', v'_theta, t + delta)
