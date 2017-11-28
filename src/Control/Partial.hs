{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RankNTypes #-}

module Control.Partial
  ( Partial
  , partial
  ) where

import Unsafe.Coerce (unsafeCoerce)

-- |
-- This type class should be used to indicate a partial function
--
-- If your functions make use of partial functions which use this annotation, you have the following options:
--
-- 1. For application developers: declare an instance of this type class, to indicate that you are willing to accept the use of partial functions globally.
-- 2. Use the partial function to selectively run partial functions.
-- 3. For library developers: pass the Partial constraint onto your users.
--
class Partial

-- |
-- Newtype wrapper for partial function, to aid in type inference.
--
newtype Wrapper r = Wrapper ((Partial) => r)

-- |
-- This function can be used to evaluate a partial function
--
partial :: ((Partial) => r) -> r
partial f = unsafeCoerce (Wrapper f) ()
