module Library where
import PdePreludat

data Componente = UnComponente {
  ingrediente :: String,
  cantidad :: Number
} deriving (Show)

data Plato = UnPlato {
  dificultad :: Number,
  componentes :: [Componente]
} deriving (Show)

type TrucoDeCocina = Plato -> Plato

data Participante = UnParticipante {
  nombre :: String,
  trucosDeCocina :: [TrucoDeCocina],
  especialidad :: Plato
} deriving (Show)

lacteos :: [String]
lacteos = ["leche", "queso", "helado"]

