module Spec where
import PdePreludat
import Library
import Test.Hspec

-- Punto 1
persona_punto1_1_test = Persona{nombre = "", edad = 25, amistades = [juan,dylan], preferencia = [], nivel_estres = 10}
persona_punto1_2_test = Persona{nombre = "", edad = 41, amistades = [juan], preferencia = [], nivel_estres = 20}
persona_punto1_3_test = Persona{nombre = "Rigoberta", edad = 31, amistades = [juan], preferencia = [], nivel_estres = 10}
-- Punto 2
persona_punto2_1_test = Persona{nombre = "", edad = 10, amistades = [juan], preferencia = [], nivel_estres = 12}
persona_punto2_2_test = Persona{nombre = "Rigoberta", edad = 26, amistades = [juan,dylan], preferencia = [], nivel_estres = 32}
-- Punto 3
persona_punto3_1_test = Persona{nombre = "", edad = 70, amistades = [], preferencia = [], nivel_estres = 20}
persona_punto3_2_test = Persona{nombre = "", edad = 18, amistades = [], preferencia = [], nivel_estres = 50}
persona_punto3_3_test = Persona{nombre = "", edad = 18, amistades = [], preferencia = [], nivel_estres = 15}
persona_punto3_4_test = Persona{nombre = "", edad = 45, amistades = [], preferencia = [], nivel_estres = 50}
persona_punto3_5_test = Persona{nombre = "", edad = 45, amistades = [], preferencia = [], nivel_estres = 75}
persona_punto3_6_test = Persona{nombre = "", edad = 45, amistades = [], preferencia = [], nivel_estres = 75}
persona_punto3_7_test = Persona{nombre = "", edad = 45, amistades = [], preferencia = [], nivel_estres = 40}
persona_punto3_8_test = Persona{nombre = "", edad = 45, amistades = [], preferencia = [], nivel_estres = 80}
-- Punto 4
persona_punto4_1_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_desenchufarse ], nivel_estres = 32}
persona_punto4_2_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_desenchufarse ], nivel_estres = 32}
persona_punto4_3_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_enchufarse 20 ], nivel_estres = 40}
persona_punto4_4_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_enchufarse 20 ], nivel_estres = 45}
persona_punto4_5_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_socializar    ], nivel_estres = 32}
persona_punto4_6_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_socializar    ], nivel_estres = 32}
persona_punto4_7_test = Persona{nombre = "", edad = 26, amistades = [], preferencia = [preferencia_sin_pretensiones ], nivel_estres = 32}
-- Punto 5
persona_punto5_1_test = Persona{nombre = "Ariel", edad = 21, amistades = [], preferencia = [preferencia_desenchufarse, preferencia_socializar], nivel_estres = 45}
persona_punto5_2_test = Persona{nombre = "Pedro", edad = 38, amistades = [], preferencia = [preferencia_sin_pretensiones], nivel_estres = 50}
contingente_1_punto5 = [persona_punto5_1_test, persona_punto5_2_test]
persona_punto5_3_test = Persona{nombre = "Carola", edad = 21, amistades = [], preferencia = [preferencia_socializar], nivel_estres = 45}
persona_punto5_4_test = Persona{nombre = "Pedro", edad = 38, amistades = [], preferencia = [preferencia_enchufarse 10], nivel_estres = 50}
contingente_2_punto5 = [persona_punto5_3_test, persona_punto5_4_test]
persona_punto5_5_test = Persona{nombre = "Pedro", edad = 38, amistades = [], preferencia = [preferencia_enchufarse 10], nivel_estres = 35}
contingente_3_punto5 = [persona_punto5_5_test,persona_punto5_3_test]
-- Punto 6
persona_punto6_1_test = Persona{nombre = "Gustavo", edad = 25, amistades = [], preferencia = [], nivel_estres = 90}
destinos_1_punto6 = [(destino_turistico_mardelplata 3), (destino_turistico_la_adela), (destino_turistico_las_toninas False)]
persona_punto6_2_test = Persona{nombre = "Carola", edad = 21, amistades = [juan], preferencia = [preferencia_socializar], nivel_estres = 45}
persona_punto6_3_test = Persona{nombre = "Pedro", edad = 38, amistades = [juan], preferencia = [preferencia_enchufarse 10], nivel_estres = 50}
contingente_1_punto6 = [juan,persona_punto6_1_test,persona_punto6_2_test]
contingente_2_punto6 = [persona_punto6_1_test,persona_punto6_2_test]
-- Punto 7
persona_punto7_1_test = Persona{nombre = "Gustavo", edad = 4, amistades = [], preferencia = [], nivel_estres = 2}
persona_punto7_2_test = Persona{nombre = "Gustavo", edad = 41, amistades = [persona_punto7_1_test], preferencia = [], nivel_estres = 90}
persona_punto7_3_test = Persona{nombre = "Fabiana", edad = 41, amistades = [juan], preferencia = [], nivel_estres = 50}
persona_punto7_4_test = Persona{nombre = "Rigoberta", edad = 31, amistades = [juan], preferencia = [], nivel_estres = 20}
persona_punto7_5_test = Persona{nombre = "Veronica", edad = 11, amistades = [juan], preferencia = [], nivel_estres = 51}
persona_punto7_6_test = Persona{nombre = "Fabiana", edad = 41, amistades = [juan], preferencia = [], nivel_estres = 50}
contingente_punto7_test_1 = [persona_punto7_1_test]
contingente_punto7_test_2 = [persona_punto7_2_test]
contingente_punto7_test_3 = [persona_punto7_3_test,persona_punto7_4_test,persona_punto7_5_test,juan]
contingente_punto7_test_4 = [juan, persona_punto7_6_test, persona_punto7_4_test]

correrTests :: IO ()
correrTests = hspec $ do
  describe "test punto 1" $ do
    it "Persona con cantidad par de amistades, edad 25 y nivel de estres 10, debe tener nivel de estres 250" $ do
      puntos_scoring persona_punto1_1_test `shouldBe` 250
    it "persona de 41 años y una amistad, debe dar 41" $ do
      puntos_scoring persona_punto1_2_test `shouldBe` 41
    it "persona de 31 años y una amistad, llamada Rigoberta, debe dar 18" $ do
      puntos_scoring persona_punto1_3_test `shouldBe` 18
  
  describe "Test Punto 2 a" $ do
    it "Paulina tiene un nombre firme" $ do
      nombre_firme "Paulina" `shouldBe` True
    it "Rigoberta NO tiene un nombre firme" $ do
      nombre_firme "Rigoberta" `shouldBe` False
  describe "test punto 2 b" $ do
    it "Una persona con 1 amistad, debe ser no interesante" $ do
      persona_interesante persona_punto2_1_test `shouldBe` False
    it "Una persona con 2 amistad, debe interesante" $ do
      persona_interesante persona_punto2_2_test `shouldBe` True
  
  describe "Test Punto 3" $ do
    it "Persona con nivel de estrés 20 se va a Mar del Plata en Enero, debe quedar con un nivel de estrés de 30" $ do
      nivel_estres (destino_turistico_mardelplata 1 persona_punto3_1_test) `shouldBe` 30
    it "Persona de edad 18 y estrés 50 se va a Mar del Plata en marzo, debe quedar con nivel de estrés 32" $ do
      nivel_estres (destino_turistico_mardelplata 3 persona_punto3_2_test) `shouldBe` 32
    it "Persona de edad 18 y estrés 15 se va a Mar del Plata en marzo, debe quedar con nivel de estrés 0" $ do
      nivel_estres (destino_turistico_mardelplata 3 persona_punto3_3_test) `shouldBe` 0
    it "Persona de edad 45 y estrés 50 se va a Mar del Plata en marzo, debe quedar con nivel de estrés 30" $ do
      nivel_estres (destino_turistico_mardelplata 3 persona_punto3_4_test) `shouldBe` 30
    it "Persona con estrés 75 se va a Las Toninas con plata, debe quedar con nivel de estrés 38" $ do
      nivel_estres (destino_turistico_las_toninas True persona_punto3_5_test) `shouldBe` 37
    it "Persona con estrés 75 se va a Las Toninas sin plata, debe quedar con nivel de estrés 55" $ do
      nivel_estres (destino_turistico_las_toninas False persona_punto3_6_test) `shouldBe` 55
    it "Persona sin amistades y estrés 40 se va a Puerto Madryn, debe quedar con nivel de estrés 0" $ do
      nivel_estres (destino_turistico_pyerto_madryn persona_punto3_7_test) `shouldBe` 0
    it "Persona sin amistades y estrés 40 se va a Puerto Madryn, debe quedar con un amistad" $ do
      (length.amistades) (destino_turistico_pyerto_madryn persona_punto3_7_test) `shouldBe` 1
    it "Persona con nivel de estrés 80 se va a La Adela, debe quedar con el mismo nivel de estrés: 80" $ do
      nivel_estres (destino_turistico_la_adela persona_punto3_8_test) `shouldBe` 80

  describe "Test Punto 4" $ do
    it "Preferencia desenchufarse para una persona que va a Mar del Plata en enero, no se debe cumplir" $ do
      preferencia_desenchufarse (destino_turistico_mardelplata 1) persona_punto4_1_test `shouldBe` False 
    it "Preferencia desenchufarse para una persona que va a Mar del Plata en marzo, se debe cumplir" $ do
      preferencia_desenchufarse (destino_turistico_mardelplata 3) persona_punto4_2_test `shouldBe` True
    it "Preferencia enchufarse con nivel de estrés 20 para una persona con nivel de estrés 40 que va a Mar del Plata en marzo, se debe cumplir" $ do
      preferencia_enchufarse 20 (destino_turistico_mardelplata 3) persona_punto4_3_test `shouldBe` True
    it "Preferencia enchufarse con nivel de estrés 20 para una persona con nivel de estrés 45 que va a Mar del Plata en marzo, no se debe cumplir" $ do
      preferencia_enchufarse 20 (destino_turistico_mardelplata 3) persona_punto4_4_test `shouldBe` False
    it "Preferencia socializar para una persona que va a Puerto Madryn, se cumple" $ do
      preferencia_socializar (destino_turistico_pyerto_madryn) persona_punto4_5_test `shouldBe` True
    it "Preferencia socializar para una persona que va a La Adela, no se cumple" $ do
      preferencia_socializar (destino_turistico_la_adela) persona_punto4_6_test `shouldBe` False
    it "Preferencia sinPretensiones para una persona que va a La Adela, se cumple" $ do
      preferencia_sin_pretensiones (destino_turistico_la_adela) persona_punto4_7_test  `shouldBe` True

  describe "Test Punto 5 a" $ do
    it "Mar del Plata en marzo es un destino apto para el contingente: " $ do
      (destino_turistico_mardelplata 3) `shouldSatisfy` destino_apto contingente_1_punto5 
    it "Mar del Plata en marzo NO es un destino apto para el contingente: " $ do
      (destino_turistico_mardelplata 3) `shouldNotSatisfy` destino_apto contingente_2_punto5  

  describe "Test Punto 5 b" $ do
    it"Mar del Plata en marzo es un destino piola para el siguiente contingente:true " $ do
      (destino_turistico_mardelplata 3) `shouldSatisfy` destino_piola contingente_3_punto5
    it"Mar del Plata en enero es un destino piola para el mismo contingente del test anterior:false " $ do
      (destino_turistico_mardelplata 1) `shouldNotSatisfy` destino_piola contingente_3_punto5
 
  describe "Test Punto 6 a" $ do
    it "Estrés de un paquete turístico que incluye ir a Mar del Plata en marzo, a La Adela y a Las Toninas sin plata, para  Gustavo, su nivel es 50: " $ do
      estres_de_paquete persona_punto6_1_test destinos_1_punto6 `shouldBe` 50 
    it "Estrés de un paquete turístico que es vacio, para  Gustavo, su nivel es 90: " $ do
      estres_de_paquete persona_punto6_1_test [] `shouldBe` 90  

  describe "Test Punto 6 b" $ do
    it"Saber si alguna persona la pasa bien con el siguiente contingente: true" $ do
      persona_la_pasa_bien contingente_1_punto6 `shouldBe` True
    it"Saber si alguna persona la pasa bien con el siguiente contingente: false" $ do
      persona_la_pasa_bien contingente_2_punto6 `shouldBe` False

  describe "Test Punto 7" $ do
    it "Contingente TOC de una persona con scoring par, da True: " $ do
      contingente_punto7_test_1 `shouldSatisfy` contingente_toc 
    it "Contingente TOC de una persona con scoring impar, da False: " $ do
      contingente_punto7_test_2 `shouldNotSatisfy` contingente_toc  
    it "Contingente TOC de varias personas, da True: " $ do
      contingente_punto7_test_3 `shouldSatisfy` contingente_toc
    it "Contingente TOC de varias personas, da False: " $ do
      contingente_punto7_test_4 `shouldNotSatisfy` contingente_toc  
      