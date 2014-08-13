module Data.List.Partial where

import Control.Partial

head :: (Partial) => [a] -> a
head (x:_) = x
head _ = error "head: empty list"

tail :: (Partial) => [a] -> [a]
tail (_:xs) = xs
tail _ = error "tail: empty list"
