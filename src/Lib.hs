module Lib
    ( someFunc, window
    ) where
import Graphics.Gloss

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- window setting
window = InWindow "simulation" (800, 800) (20, 20)
