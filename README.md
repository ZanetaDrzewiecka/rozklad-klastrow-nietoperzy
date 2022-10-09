# rozklad-klastrow-nietoperzy
## Cel projektu

Ta symulacja nawiązuje do zjawiska hibernowania nietoperzy w MRU. Interesuje nas rozkład klastrów jakie tworzą nietoperze w okresie zimowym. Symulacja ma pokazać jaki jest rozkład klastrów określonych rzędów w zależności od $pr$ - ustalone prawdopodobieństwo zawiśnięcia nietoperza w sąsiedztwie innego lub innych nietoperzy oraz innych parametrów symulacji.
## Założenia

  **1.** Nietoperzy jest $NP$. Do pomieszczanie wlatują pojedynczo.
  
  **2.** Tylko sufit jest obszarem podwieszania się nietoperzy. Ma kształt prostokąta, podzielonego na $M$ × $K$ miejsc. Jedno miejsce może zajmować tylko jeden nietoperz.
  
  **3.** Nietoperz decyduje by zawisnąć w sąsiedztwie innego/innych nietoperzy z prawdopodobieństwem $0 < pr < 1$.
  

## Opis algorytmu 

  **Krok 1.** Wprowadź liczby: $N$- ilość symulacji, $NP$- ilość nietoperzy, $M$, $K$- wymiar macierzy, $pr$- prawdopodobieństwo przytulenia. Utwórz pustą listę LL. 
  
  **Krok 2.** Utwórz macierz wymiaru $M$ x $K$, wypełnioną 0. Zera oznaczają miejsca wolne, w których może zawisnąć nietoperz. 
  
  **Krok 3.** Poprzez losowanie z ustalonym prawdopodobieństwem $pr$ ustal czy dany nietoperz chce się przytulić, czy nie. Jeżeli nie, to przejdź do kroku 4, jeżeli tak to przejdź do kroku 5.
  
  **Krok 4.** Wylosuj jedną z wolnych pozycji oznaczonych jako 0 i przypisz do niej nietoperza - oznacz to miejsce poprzez 1. Miejsca sąsiednie oznacz jako 2 - komórkę po lewej, po prawej, powyżej i poniżej. Przejdź do kroku 3. Jeśli wszystkie nietoperze, opisane liczbą $NP$, zostały umieszczone w macierzy, przejdź do kroku 6.
  
  **Krok 5.** Wylosuj jedną z wolnych pozycji oznaczonych jako 2 i przypisz do niej nietoperza poprzez 1. Miejsca sąsiednie oznacz jako 2, z wyjątkiem pozycji, które wcześniej były oznaczone jako 1. Przejdź do kroku 3. Jeśli wszystkie nietoperze, opisane liczbą $NP$, zostały umieszczone w macierzy, przejdź do kroku 6.
  
  **Krok 6.** Zamień wszystkie 2 na 0.

  
  **Krok 7.** Koniec algorytmu.
  
## Wyniki symulacji

Symulacja została przeprowadzona dla nastepujących parametrów: 

  **-** N = 50 
  
  **-** NP = 86 
  
  **-** M = 20 
  
  **-** K = 10 
  
  **-** pr = 0.65 
  
Powstały histogram:

![image](https://user-images.githubusercontent.com/105323115/194776015-aeb532d0-11df-45dd-8b64-51a2b8c254cf.png)

## Podsumowanie:

  **1.** Im większe prawdopodobieństwo przytulenia się nietoperza, tym mniejsze prawdopodobieństwo wystąpienia klastrów z jednym osobnikiem. 
  
  **2.** Zjawisko można przedstawić za pomocą rozkładu wykładniczego.  


