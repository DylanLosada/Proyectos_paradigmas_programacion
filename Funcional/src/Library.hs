module Library where
import PdePreludat

data Persona = 
    Persona{
      nombre       :: String,
      edad         :: Number,
      nivel_estres :: Number,
      preferencia  :: [Funcion_preferencia],
      amistades    :: [Persona]
    } deriving  (Show)

instance Eq Persona where 
    (==) persona1 persona2 = nombre persona1  == nombre persona2 



-- Punto 1
-- parte a
cantidad_par_de_amigos :: Persona -> Bool
cantidad_par_de_amigos = even.length.amistades

edad_mayor_que_cuarenta :: Persona -> Bool
edad_mayor_que_cuarenta = ( >40 ).edad 

puntos_scoring :: Persona -> Number
puntos_scoring persona
    | cantidad_par_de_amigos persona = nivel_estres persona * edad persona
    | edad_mayor_que_cuarenta persona = (edad persona) * (length.amistades) persona
    | otherwise = ((*2).length.nombre) persona

-- Punto 2
-- parte a
nombre_firme :: String -> Bool
nombre_firme = (== 'P').head

-- parte b
persona_interesante :: Persona -> Bool
persona_interesante = (>=2).length.amistades

-- Punto 3

type Destino = Persona -> Persona
type Mes = Number
type TienePlata = Bool
juan = Persona{nombre = "Juan", preferencia = [], amistades = [], edad = 37, nivel_estres = 80}
dylan = Persona{nombre = "Dylan", edad =  41 ,nivel_estres = 67, preferencia =  [], amistades = []}

persona_edad_mayor_de_veinte :: Persona -> Bool
persona_edad_mayor_de_veinte = (>=20).edad

disminuir_estres :: Number -> Destino
disminuir_estres disminuye_estres persona = persona{nivel_estres = max (nivel_estres persona - disminuye_estres) 0}

disminuir_estres_mardelplata :: Destino
disminuir_estres_mardelplata persona
    | persona_edad_mayor_de_veinte persona = disminuir_estres 20 persona  
    | otherwise = disminuir_estres (edad persona) persona 

destino_turistico_mardelplata :: Mes -> Destino 
destino_turistico_mardelplata mes persona
    | mes == 1 || mes == 2 = persona{nivel_estres = nivel_estres persona + 10 }
    | otherwise = disminuir_estres_mardelplata persona

destino_turistico_las_toninas :: TienePlata -> Destino
destino_turistico_las_toninas True persona = persona{nivel_estres = div (nivel_estres persona) 2}
destino_turistico_las_toninas False persona = destino_turistico_mardelplata 6 persona
destino_turistico_pyerto_madryn :: Destino
destino_turistico_pyerto_madryn persona = persona{nivel_estres = 0, amistades = juan : (amistades persona)}
destino_turistico_la_adela :: Destino
destino_turistico_la_adela persona = persona

--punto 4
type Funcion_preferencia = Destino -> Persona -> Bool
type Estres_Preferencia = Number

preferencia_desenchufarse :: Funcion_preferencia
preferencia_desenchufarse destino persona = (nivel_estres.destino) persona < nivel_estres persona

preferencia_enchufarse :: Estres_Preferencia -> Funcion_preferencia
preferencia_enchufarse estres_Preferencia destino persona = (nivel_estres.destino) persona == estres_Preferencia
    
preferencia_socializar :: Funcion_preferencia
preferencia_socializar destino persona = (length.amistades.destino) persona > (length.amistades) persona
   
preferencia_sin_pretensiones :: Funcion_preferencia
preferencia_sin_pretensiones _ _ = True

-- TP 2
-- Punto 5
-- a
type Contingente = [Persona]

cumple_preferencia :: Destino -> Persona -> Bool
cumple_preferencia destino persona = any (aplicar_preferencia destino persona) (preferencia persona)

aplicar_preferencia :: Destino -> Persona -> Funcion_preferencia -> Bool
aplicar_preferencia destino persona preferen = preferen destino persona

destino_apto :: Contingente -> Destino -> Bool
destino_apto contingente destino =  all (cumple_preferencia destino) contingente

--b
destino_piola :: Contingente -> Destino -> Bool
destino_piola contingente destino = (< 100).sum.map (nivel_estres.destino) $ contingente 

-- Punto 6
-- a
type Paqute_turistico = [Destino]
type Nivel_Estres = Number

estres_de_paquete :: Persona -> Paqute_turistico -> Nivel_Estres
estres_de_paquete persona paquete = nivel_estres (foldr ($) persona paquete)

--b
persona_la_pasa_bien :: Contingente -> Bool
persona_la_pasa_bien contingente = any (flip elem (concat.map amistades $ contingente)) $ contingente

-- Punto 7
esScoringPar :: (Persona, Bool) -> Bool
esScoringPar = even.puntos_scoring.fst 

obtenerPosicionesParesEImpares :: [Persona] -> [(Persona, Bool)]
obtenerPosicionesParesEImpares [persona] = [(persona, True)]
obtenerPosicionesParesEImpares (x : xs) = foldl (\ base elem -> base ++ [(elem ,(not.snd.last) base)] ) [(x, False)] xs

contingente_toc :: Contingente -> Bool
contingente_toc = (all esScoringPar).(filter snd).obtenerPosicionesParesEImpares


{-- Punto 8
    Pregunta A) Es posible, dado que con un any con que un valor nos retorne True ya deja de iterar la lista. 
    Si nuestro valor esta en la posicion 6000, al llegar comprobara la condicion y al dar True nos dara como 
    retorno que la condicion si se cumple para algun elemento de la lista infinita. Esto se debe al Lazy evalution 
    que posee Haskell.
    Pregunta B) No es posible, ya que se necesita la suma del estres de todas las personas del continguente
    para poder evaluar si el resultado total es menor a 100, como la lista es infinita nunca se acabaria de sumar
    por lo tanto nunca habria un resultado para evaluar si es mayor a 100
    --}
