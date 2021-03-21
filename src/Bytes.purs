module Bytes where

import Data.Show (class Show)
import Data.ArrayBuffer.Types (ArrayBuffer, Uint8Array, Uint8)

foreign import _showBytes :: Uint8Array -> String
-- foreign import _mapBytes :: forall b. (Byte -> b) -> Uint8Array -> Array b

type Byte = Int --  ???? should be Uint8
newtype Bytes = Bytes Uint8Array

instance showBytes :: Show Bytes where
    show (Bytes bytes) = _showBytes bytes

-- mapUint8Array :: forall b. (Byte -> b) -> Bytes -> Array b
-- mapUint8Array f (Bytes bytes) = _mapBytes f bytes

-- foldMapBytes :: forall m. Monoid m => (Byte -> m) -> Bytes -> m
-- foldMapBytes f bytes = _foldMap mempty 

foreign import _foldMapBytesToString :: (Byte -> String) -> Bytes -> String
foldMapBytesToString :: (Byte -> String) -> Bytes -> String
foldMapBytesToString f bytes = _foldMapBytesToString f bytes
