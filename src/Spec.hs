module Spec where
import PdePreludat
import Test.Hspec
import Library

correrTests :: IO ()
correrTests = hspec $ do
    describe "Test de ejemplo" $ do
        it "1 debería ser igual a 1" $ do
            1 `shouldBe` 1
