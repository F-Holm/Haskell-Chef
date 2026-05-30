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

-- Parte A
agregarComponente :: Componente -> Plato -> Plato
agregarComponente unComponente unPlato = unPlato { componentes = unComponente : componentes unPlato }

endulzar :: Number -> TrucoDeCocina
endulzar unaCantidad unPlato = agregarComponente (UnComponente "Azucar" unaCantidad) unPlato

salar :: Number -> TrucoDeCocina
salar unaCantidad unPlato = agregarComponente (UnComponente "Sal" unaCantidad) unPlato

darSabor :: Number -> Number -> TrucoDeCocina
darSabor unaCantidadDeAzucar unaCantidadDeSal unPlato = endulzar unaCantidadDeAzucar.salar unaCantidadDeSal $ unPlato

duplicarSaborComponente :: Componente -> Componente
duplicarSaborComponente unComponente = unComponente { cantidad = cantidad unComponente }

duplicarPorcion :: TrucoDeCocina
duplicarPorcion unPlato = unPlato { componentes = map duplicarSaborComponente.componentes $ unPlato }

esPlatoDificil :: Plato -> Bool
esPlatoDificil unPlato = (> 7).dificultad $ unPlato

tieneMuchosComponentes :: Plato -> Bool
tieneMuchosComponentes unPlato = (> 5).length.componentes $ unPlato

esComplejo :: Plato -> Bool
esComplejo unPlato = esPlatoDificil unPlato && tieneMuchosComponentes unPlato

esComponenteSignificativo :: Componente -> Bool
esComponenteSignificativo unComponente = (>= 10).cantidad $ unComponente

eliminarComponentesInsignificantes :: Plato -> Plato
eliminarComponentesInsignificantes unPlato = unPlato { componentes = filter esComponenteSignificativo.componentes $ unPlato }

simplificar :: TrucoDeCocina
simplificar unPlato
  | esComplejo unPlato = eliminarComponentesInsignificantes unPlato { dificultad = 5 }
  | otherwise = unPlato

tieneComponente :: Plato -> String -> Bool
tieneComponente unPlato unIngrediente = any ((== unIngrediente).ingrediente).componentes $ unPlato

tieneComponentes :: [String] -> Plato -> Bool
tieneComponentes unosIngredientes unPlato = any (tieneComponente unPlato) unosIngredientes 

esVegano :: Plato -> Bool
esVegano unPlato = not.tieneComponentes (["carne", "huevos"] ++ lacteos) $ unPlato

esSinTacc :: Plato -> Bool
esSinTacc unPlato = not.tieneComponente unPlato $ "harina"

tieneMuchaSal :: Componente -> Bool
tieneMuchaSal unComponente = (> 2).cantidad $ unComponente

noAptoHipertension :: Plato -> Bool
noAptoHipertension unPlato = any tieneMuchaSal.componentes $ unPlato

-- Parte B
componenteSal :: Componente
componenteSal = UnComponente "sal" 15
componenteAzucar :: Componente
componenteAzucar = UnComponente "azucar" 10
componenteCarne :: Componente
componenteCarne = UnComponente "carne" 2
componenteHarina :: Componente
componenteHarina = UnComponente "harina" 3
componenteLeche :: Componente
componenteLeche = UnComponente "leche" 6
componenteQueso :: Componente
componenteQueso = UnComponente "queso" 6

platoDePepeRonccino :: Plato
platoDePepeRonccino = UnPlato 10 [componenteSal, componenteAzucar, componenteCarne, componenteHarina, componenteLeche, componenteLeche]

pepeRonccino :: Participante
pepeRonccino = UnParticipante "Pepe Ronccino" [darSabor 5 2, simplificar, duplicarPorcion] platoDePepeRonccino
