# partial

A nullary type class for partial functions

## Introduction

Use the `Partial` type class to track your partial functions. For example:

```haskell
{-# LANGUAGE NullaryTypeClasses #-}

import Data.List.Partial

cadr :: (Partial) => [a] -> a
cadr = head . head
```

As an application developer, either opt into partial functions globally by declaring an instance of the `Partial` type class:

```haskell
instance Partial
```

or run partial functions selectively using the `partial` function:

```haskell
ghci> partial $ cadr [1, 2, 3]
2
```
