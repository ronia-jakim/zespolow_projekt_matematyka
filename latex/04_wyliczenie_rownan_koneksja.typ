== Równanie geodezyjnej //w pobliżu czarnej dziury Schwarzschilda

/*
Po pierwsze zauważmy, że nie interesuje nas tak naprawdę samo $gamma$, gdyż ono opisuje tylko położenie w zależności od czasu. W naszym przypadku o wiele bardziej przydatna będzie znajomość wektora prędkości, czyli $frac(d gamma, d t)$, który tak naprawdę jest szczególnym przykładem pola wektorowego wzdłuż krzywej, czyli przyporządkowania 
$ V:I arrow T"BH" $ 
takiego, że dla dowolnego $t in I$ zachodzi $V(t) in T_(gamma(t))"BH"$. 
*/

//Rozważmy pokrycie rozmaitości $"BH"$ mapami $(bb(R) times (0, +oo) times U_i^plus.minus, phi_i^plus.minus)$, gdzie zbiory $U_1^+$ i $U_1^-$ to odpowiednio prawa i lewa półkula sfery $S^2$, natomiast $U_2^+$ i $U_2^-$ to górna i dolna półkula. Odwzorowania $phi_i^plus.minus$ to wówczas identyczność na pierwszych dwóch współrzędnych, a rzut na płaszczyznę $bb(R)^2$ z odpowiedniej półkuli. Wiemy, że funkcje $frac(diff, diff (phi_i^plus.minus)^j)$ są bazą przestrzeni stycznej w dowolnym punkcie mapy $phi_i^plus.minus$.]

Ponieważ foton nie przyśpiesza podróżując po przestrzeni wokół czarnej dziury, tzn. druga pochodna krzywej opisującej jego trasę jest stale równa zero, to mówimy, że trasa zataczana przez foton jest *linią geodezyjną* na rozmaitości $"BH"$. O linii geodezyjnej można myśleć jako o najszybszej ścieżce między dwoma punktami - taką właśnie najmniej pochłaniającą energię drogę wybierają zazwyczaj obiekty fizyczne.

Zauważmy, że patrząc na podróż fotona, przesuwamy wraz z nim przestrzeń styczną, zawierającą wektor prędkości, po krzywej którą ów foton zatacza. Patrząc znów na prosty przykład na $S^2$, przyjżyjmy się co się dzieje z wektorami stycznymi kiedy przesuwamy je na dwa sposoby między tymi samymi punktami leżącymi na równiku:

#import "@preview/cetz:0.1.2"

#let pomaranczka(x) = text(fill: orange, $#x$)
#let niebieskie(x) = text(fill: blue, $#x$)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0,0), radius: 4, name: "sphere")
    arc((-4, 0), start: 180deg, stop: 360deg, radius: (4, 1.7))
    arc((-4, 0), start: 180deg, stop: 0deg, radius: (4, 1.7), stroke: (dash: "dotted"))

    arc((0, -1.7), start: 270deg, stop: 300deg, radius: (4, 1.7), mark: (end: ">", fill: orange), stroke: (paint: orange, thickness: 2pt))
    arc((0, -1.7), start: 270deg, stop: 240deg, radius: (4, 1.7), mark: (end: ">", fill: orange), stroke: (paint: orange, thickness: 2pt))
    
    circle((-2, -1.47), stroke: (paint: orange), fill: orange, radius: 2pt)
    circle((2, -1.47), stroke: (paint: orange), fill: orange, radius: 2pt)

    arc((-2, -1.47), start: 180deg, stop: 135deg, radius: (7, 7.8), stroke:(paint: blue))
    arc((2, -1.47), start: 0deg, stop: 45deg, radius: (7, 7.8), stroke:(paint: blue))
    circle((0, 4), stroke: (paint: blue), fill: blue, radius:2pt)

    line((-2, -1.47), (-1.8, 0), mark: (end: ">"))
    line((-2, -1.47), (-0.6, -1.7), mark: (end: ">")) 
    content((-1.5, -1.65), [$e_1$])
    content((-2.2, -0.7), [$e_2$])

    line((0, 4), (1.3, 4), mark: (end: ">"), stroke: (paint: blue))
    line((0, 4), (0, 2.7), mark: (end: ">"), stroke: (paint: blue))
    content((0.7, 4.3), [$e_2$])
    content((0.3, 3.2), [$e_1$])

    line((2, -1.47), (1.8, 0), mark: (end: ">"), stroke: (paint: orange))
    line((2, -1.47), (3.4, -1.24), mark: (end: ">"), stroke: (paint: orange)) 
    content((2.6, -1), [$pomaranczka(e_1)$])
    content((2.2, -0.7), [$pomaranczka(e_2)$])


    line((2, -1.47), (3.4, -1.24), mark: (end: ">"), stroke: (paint: blue, dash: "dashed"))
    line((2, -1.47), (1.8, -2.94), mark: (end: ">"), stroke: (paint: blue))
    content((2.6, -1.6), [$niebieskie(e_2)$])
    content((2.2, -2.2), [$niebieskie(e_1)$])
  })
]

Idąc przez północny biegun sfery wektory styczne obracają się i na końcu trasy nie zgadzają się z wektorami, które były przesuwane po równiku. O operacji przesuwania wektorów stycznych wzdłuż krzywej można myśleć jako o składaniu pól wektorowych - przesuwane wektory są jednym polem, a wektor prędkości na krzywej jest drguim polem. W celu uzgodnienia tego, jak przesuwać przestrzeń styczną wzdłuż krzywej, lub bardziej ogólnie jak składać pola wektorowe, potrzebne jest użycie koneksji Levi-Civity.

*Koneksja Levi-Civity* jest połączeniem affinicznym, który składowe pola wektorowego przenosi na przestrzeń stycznyną nieskończnenie odległą od rozmaitości. Można o tym myśleć jako o rzutowaniu wektorów stycznych w różnych punktach na daleką kartkę papieru. Dzięki temu możemy porównywać pola wektorowe w dowolnych punktach na rozmaitości. 

/*
Formalna definicja koneksji Levi-Civity mówi, że jest to połączenie affiniczne $nabla$ które 
- zachowuje metrykę, tzn. $nabla g=0$ 
- oraz jest pozbawione torsji, tzn. dla dowolnych pól wektorowych $X, Y$ mamy $nabla_X Y-nabla_Y X=[X, Y]$, gdzie $[X, Y]$ jest pochodną Liego $X, Y$.
*/

Jeśli teraz $x_1,..., x_n$ są lokalnymi współrzędnymi na rozmaitości, a $diff_1,...,diff_n$ wektorami bazowymi przestrzenis stycznej, to możemy zdefiniować *symbole Christoffela* dla koneksji $nabla$ względem tego układu współrzędnych jako liczby spełniające poniższą równość:
$ nabla_j diff_k=Gamma_(j k)^l diff_l. $
W przypadku czarnej dziury rolę koneksji Levi-Civity będzie spełniać pochona względem czasu właściwego $tau$. W celu uproszczenia notacji i zadowoleniu zmysłu konformizmu z popularną notacją, dla wektora $v$ będziemy pisać 
$ nabla v = accent(v, dot). $

Niech więc $x_i$ będzie lokalnym układem współrzędnych na $"BH"$. Wtedy krzywa $gamma$ zadaje gładkie funkcje $t arrow.bar x_i (t)=x_i (gamma(t))$, które dają funkcję $bb(R) arrow bb(R)^4$. W celu uproszczenia notacji nie będziemy się przejmować faktem, że badamy krzywe na $"BH"$. Zamiast tego będziemy od razu pisać $x_i=x_i(t)$. Równanie różniczkowe opisującę geodezyjną którą podróżuje foton przedstawia się wtedy jako
//$ nabla accent(gamma, dot) (t) = Gamma_(i,j)^k (x_1(t),...,x_4(t))frac(d x^i, d t) frac(d x^j, d t) = 0 $
$ accent(gamma, diaer) = - Gamma_(i,j)^k accent(x^i, dot) accent(x^j, dot) $
gdzie $Gamma_(i,j)^k$ to symbol Christoffela drugiego rodzaju.//, natomiast $dot$ nad zmienną oznacza branie jej pochodnej względem pewnej affinicznej parametryzacji, która przychodzi razem z koneksją Levi-Civity.

Dodatkowo, ponieważ foton jest cząsteczką bez masy, geodezyjna którą on podróżuje jest określana _nullową_ geodezyjną i musi spełniać dodatkowy warunek
$ g_(mu,nu) accent(x^mu, dot)accent(x^nu, dot) = 0 $
gdzie $g_(mu,nu)$ to wartość tensora metrycznego $g(mu, nu)$.














//wyznaczony za pomocą koneksji Levi-Cevity. W szczególności interesuje nas fakt, że $i$-ta współrzędna wektora prędkości fotonu wyraża się jako
//$ gamma ^i (t)= -Gamma_(m,j)^i frac(d x^m, d t) gamma ^j (t). $

/*Symbole Christoffela użyte w obliczeniach zostały zaczerpnięte z @symboleGotowe.

Ponieważ foton w naszym przypadku porusza się po płaszczyźnie przechodzącej przez równik, to $x^3 = theta = pi / 2$ jest funkcją stałą. Interesują nas więc tylko wartości zmiany $phi=x^4$ oraz $r=x^2$ w czasie, czyli
/*$ phi' = -( 1 / r r' phi + 1 / r phi' r)=-( phi / r r' + phi') $
$ r' = - ( frac(G M, r^2) (1 - (2G M) / r ) t - frac(G M, r^2) (1 - (2G M) / r)^(-1) r' r ) $ */

$ phi' =  -Gamma_(r, phi)^phi r' phi - Gamma_(theta, phi)^phi theta' phi=- frac(r', r) phi - 0 $
$ r' = -Gamma_(t, t)^r t' t - Gamma_(phi, phi)^r phi' phi -Gamma_(theta, theta)^r theta' theta - Gamma_(r, r)^r r' r = -e^(2 X - 2 V) frac(diff_r X, diff r) t + r e^(-2 V)phi' phi - frac(diff V, diff r) r' r $

gdzie
$ e^(2x)= e^(-2V)=(1- frac(2G M, c^2 r)) $

Czyli równanie to 
$ phi' = -frac(r', r) phi $
$ r' =  $
*/

