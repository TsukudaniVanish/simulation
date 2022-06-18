module Main where

import Pendulum
import Debug.Trace

main :: IO ()
main = do
  i <- readLn :: IO(Int)
  case i of
    0 -> putStrLn "Bye"
    1 -> showPen
