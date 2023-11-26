== Przygotowania

/*
Po pierwsze zauważmy, że nie interesuje nas tak naprawdę samo $gamma$, gdyż ono opisuje tylko położenie w zależności od czasu. W naszym przypadku o wiele bardziej przydatna będzie znajomość wektora prędkości, czyli $frac(d gamma, d t)$, który tak naprawdę jest szczególnym przykładem pola wektorowego wzdłuż krzywej, czyli przyporządkowania 
$ V:I arrow T"BH" $ 
takiego, że dla dowolnego $t in I$ zachodzi $V(t) in T_(gamma(t))"BH"$. 
*/

//Rozważmy pokrycie rozmaitości $"BH"$ mapami $(bb(R) times (0, +oo) times U_i^plus.minus, phi_i^plus.minus)$, gdzie zbiory $U_1^+$ i $U_1^-$ to odpowiednio prawa i lewa półkula sfery $S^2$, natomiast $U_2^+$ i $U_2^-$ to górna i dolna półkula. Odwzorowania $phi_i^plus.minus$ to wówczas identyczność na pierwszych dwóch współrzędnych, a rzut na płaszczyznę $bb(R)^2$ z odpowiedniej półkuli. Wiemy, że funkcje $frac(diff, diff (phi_i^plus.minus)^j)$ są bazą przestrzeni stycznej w dowolnym punkcie mapy $phi_i^plus.minus$.]

Ponieważ foton nie przyśpiesza podróżując po przestrzeni wokół czarnej dziury, tzn. druga pochodna krzywej opisującej jego trasę jest stale równa zero, to mówimy, że trasa zataczana przez foton jest *linią geodezyjną* na rozmaitości $"BH"$. Jeśli więc $x_i$ będzie lokalnym układem współrzędnych na $"BH"$, to krzywa $gamma$ zadaje gładkie funkcje $t arrow.bar x_i (t)=x_i (gamma(t))$. Wówczas równanie różniczkowe opisującę geodezyjną przedstawia się jako
$ Gamma_(i,j)^k (x_1(t),...,x_4(t))frac(d x^i, d t) frac(d x^j, d t) = 0 $
gdzie $Gamma_(i,j)^k$ to symbol Christoffela drugiego rodzaju wyznaczony za pomocą koneksji Levi-Cevity. W szczególności interesuje nas fakt, że $i$-ta współrzędna wektora prędkości fotonu wyraża się jako
$ gamma ^i(t)= -Gamma_(m,j)^i frac(d x^m, d x) gamma ^j(t). $

Symbole Christoffela użyte w obliczeniach zostały zaczerpnięte z @symboleGotowe.

Ponieważ foton w naszym przypadku porusza się po płaszczyźnie przechodzącej przez równik, to $x^3 = theta = pi / 2$ jest funkcją stałą. Interesują nas więc tylko wartości zmiany $phi=x^4$ oraz $r=x^2$ w czasie, czyli
$ phi' = -( 1 / r r' phi + 1 / r phi' r)=-( phi / r r' + phi') $
$ r' = - ( frac(G M, r^2) (1 - (2G M) / r ) t - frac(G M, r^2) (1 - (2G M) / r)^(-1) r' r ) $
