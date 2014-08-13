{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE NullaryTypeClasses #-}

module Control.Partial where

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
-- This function can be used to evaluate a partial function
--
partial :: ((Partial) => r) -> r
partial = ($ ()) . unsafeCoerce
            
