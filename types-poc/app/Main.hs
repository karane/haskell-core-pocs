{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Main where

-- | 1. Type class declaration
class ToText a where
  toText :: a -> String

-- | 2. Instances for primitive types
instance ToText Int where
  toText = show

instance ToText Bool where
  toText True  = "true"
  toText False = "false"

instance ToText String where
  toText = id

-- | 3. Your own algebraic data type
data Shape
  = Circle Double
  | Rectangle Double Double
  deriving Show

instance ToText Shape where
  toText (Circle r)        = "Circle with radius " ++ show r
  toText (Rectangle w h)   = "Rectangle " ++ show w ++ "x" ++ show h

-- | 4. Polymorphic functions
double :: Num a => a -> a
double x = x + x

identity :: a -> a
identity x = x

-- | Main program demonstrating the type system
main :: IO ()
main = do
  putStrLn "=== Haskell Type System Demo ==="

  -- Num polymorphism
  print (double (10 :: Int))
  print (double (10.5 :: Double))

  -- Parametric polymorphism
  print (identity "hello")
  print (identity True)

  -- Type classes
  putStrLn (toText (42 :: Int))
  putStrLn (toText True)
  putStrLn (toText ("Text values also work." :: String))

  -- Algebraic data types + type classes
  putStrLn (toText (Circle 3.2))
  putStrLn (toText (Rectangle 4 5))
