-- Ejemplo Sub ZeroMQ - Taller de Sabado 14 mayo 2016
-- Autor: Camilo Chacón Sartori

{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad
import qualified Data.ByteString.Char8 as BS
import           System.ZMQ4.Monadic
import           Text.Printf

main :: IO ()
main = runZMQ $ do

    subscriber <- socket Sub
    connect subscriber "tcp://127.0.0.1:6001"
    subscribe subscriber "TallerDeSabado"

    forever $ do
        -- Se extrae el canal de comunicación
        channel <- receive subscriber

        -- Se extra el mensaje desde el publicador
        message <- receive subscriber
        liftIO $ printf "Haskell -- [Channel: %s] Message: %s\n" (BS.unpack channel) (BS.unpack message)
