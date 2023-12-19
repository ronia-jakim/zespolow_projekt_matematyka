W poniższej pracy dokonamy analizy ruchu fotonów w pobliżu czarnej dziury, której promień Schwarzschilda wynosi $r_s=1$. Aby dodatkowo ułatwić rozważania, przyjmujemy $c=G=1$ i konsekwentnie $M=frac(1, 2)$.

== Symbole Christoffela

Dla wygody, nie będziemy wyliczać symboli Christoffela wprost. Zamiast tego, skorzystamy z lagrangianu, który spełnia
/*Oczywiście, wyliczyć symbole Christoffela można wprost z ich definicji. Prostsze jest jednak użycie lagrangianu, który spełnia*/
$ S = integral L d lambda, $
gdzie $lambda$ jest afiniczną parametryzacją, a $S$ to działanie, czyli w prostym przypadku cząsteczki poruszającej się wzdłuż pojedynczej krzywej jest to suma iloczynu pędu cząsteczki z fragmentem drogi przebytej. 

//Używając więc tych faktów w przypadku fotona poruszającego się w metryce Schwarzschilda dostajemy
Stosując więc powyższe wiadomości dla przypadku fotona poruszającego się w metryce Schwarzschilda dostajemy
$ S = integral d tau= integral frac(d tau, d tau) d tau = integral frac(sqrt(d tau^2), d tau) d tau =integral sqrt(g_(mu, nu)accent(x^mu, dot) accent(x^nu, dot))d tau = integral L' d tau. $
W takim razie jednym z lagrangianów jest $L'=sqrt(g_(mu, nu)accent(x^mu, dot)accent(x^nu, dot))$. Ponieważ lagrangian nie jest unikalny, i nałożenie na niego dowolnej funkcji dalej daje lagrangian, to możemy wybrać
$ L=(L')^2 = g_(mu,nu)accent(x^mu,dot)accent(x^nu,dot). $
Ułatwi to nam wyliczenia korzystające z drugiego równania lagrangianu, to znaczy:
$ frac(d, d tau)(frac(diff L, diff accent(x^mu, dot)))= frac(diff L, diff x^mu). $
Podstawiając do $d tau$ metrykę Schwarzschilda dostajemy poniższy układ równań:
$ d tau ^ 2 = (1- frac(1, r)) d t^2 - (1-frac(1, r))^(-1)d r^2-r^2d theta^2 - r^2 sin^2 theta d phi^2 $

$ 
  /*frac(r-1, r)*/accent(t, diaer) &=- frac(1, r(r-1)) accent(r, dot)accent(t, dot)\ 

     accent(r, diaer)&=-frac(r-1, 2r^3) accent(t, dot)^2+frac(1, 2r(r-1))accent(r, dot)^2+(r-1)accent(theta, dot)^2+(r-1)sin^2theta accent(phi, dot)^2\

      accent(theta, diaer) &= sin theta cos theta accent(phi, dot)^2 - frac(2, r) accent(r, dot)accent(theta, dot)\

      accent(phi, diaer) &= -frac(2, r) accent(r, dot)accent(phi, dot) - 2 frac(cos theta, sin theta) accent(phi, dot)  accent(theta, dot) /* accent(phi, dot)r^2 sin^2 theta*/
$
Zauważmy, że otrzymane wyżej równania to tak naprawdę geodezyjna w metryce Schwarzschilda. Z lewej strony równości można więc z łatwością sczytać symbole Christoffela - są to współczynniki przy odpowiednich pochodnych. Ponieważ interesuje nas tylko ruch fotonów po płaszczyźnie $theta=frac(pi, 2)$, to $accent(theta, dot)=0$, $cos theta=0$ i $sin theta=1$.

/* 
Oczywiście, $accent(r, diaer)=0$, bo foton nie przyśpiesza. Możemy więc podzielić drugie równanie przez $accent(phi, dot)^2$, by dostać:

$ 0=frac(r-1, 2r^3)(frac(accent(t, dot), accent(phi, dot)))^2 +frac(1, 2r(r-1))(frac(accent(r, dot), accent(phi, dot)))^2 - (r-1) $
$ (frac(accent(r, dot), accent(phi, dot)))^2=2r(r-1)^2-frac((r-1)^2, r^2)(frac(accent(t, dot), accent(phi, dot)))^2. $

*/

Chcemy teraz wydobyć $accent(t, dot)$ oraz $accent(phi, dot)$ - wtedy będziemy wiedzieli jak wyrazić $frac(accent(t, dot), accent(phi, dot))$. Wracając do drugiej równości lagrangiana wykorzystanej dla $phi$ oraz $t$, dostaniemy:
$ 
  frac(d, d tau) (2r^2 accent(phi, dot))&=0\ 
    frac(d, d tau) (2frac(r-1, r)accent(t, dot))&=0
$
Co znaczy, że
$ r^2 accent(phi, dot)=a => accent(phi, dot)=frac(a, r^2) $
$ frac(r-1, r)accent(t, dot)=frac(a, b) => accent(t, dot) = frac(a r, b(r-1)) $
dla pewnych stałych $a, b$.

Przekształcając teraz metrykę Schwarzschilda, dostajemy
$ frac(r-1, r) = frac((r-1)^2, r^2)accent(t, dot)^2 - accent(r, dot)^2 -r(r-1) accent(phi, dot)^2 $
a podstawiając wartości $accent(phi, dot)^2$ i $accent(t, dot)^2$ wyliczone wyżej
$ frac(r-1, r) = frac(a^2, b^2) - accent(r, dot)^2 - r(r-1)a^2 $
$ accent(r, dot)^2 = frac(a^2, b^2) - frac(r-1, r)(1 + frac(a^2, r^2)). $
Aby teraz wyliczyć równanie orbity, chcemy podzielić powyższe równanie przez $accent(phi, dot)^2=frac(a, r^2)$:
$ ( frac(accent(r, dot), accent(phi, dot)) )^2 = frac(r^4, b^2) - frac((r-1), r)(frac(r^4, a^2)+r^2) $
Trzeba tutaj zaznaczyć, że równanie wyliczone wyżej nie jest jeszcze krzywą geodezyjną po której podróżuje światlo - w przypadku wyżej wzięliśmy
$ -1 = g_(mu, nu)accent(x^mu, dot)accent(x^nu, dot) $
zamiast przyrównywać to do zera. Badamy więc chwilowo trasę cząsteczki z masą. Aby przejść do badania fotonu, chcemy aby $a arrow oo$. Fizycznie wartość ta jest tak naprawdę równa pędowi kątowemu $L$ wydzielonemu przez zredukowaną masę $mu$, tzn.
$ r^2 accent(phi, dot)^2 = a = frac(L, mu) $
a ponieważ zredukowana masa jest zależna od masy fotonu $m_1=0$, 
$ mu = frac(m_1 m_2, m_1 + m_2), $
gdzie $m_1, m_2$ to masy składowe układu dwóch ciał, to dla fotonu $mu=0$ i co za tym idzie, $a arrow oo$.

== Równanie orbity

W równaniu orbity wyliczonym w poprzednim rozdziale zastosujemy podstawienie $u=frac(1, r)$, wtedy
$ -r^2 accent(u, dot) = accent(r, dot). $
Po takim podstawieniu równanie orbity to
$ ( frac(accent(u, dot), accent(phi, dot)) )^2 = frac(1, b^2) - (1-u)(frac(1, a^2)+u^2) = frac(1, b^2)-(1-u)u^2 $
bo jak wcześniej uzasadniliśmy, $a arrow oo$.

Rozwiązanie powyższego równania dałoby zależność między $r$ a $phi$, bo możemy usunąć trzymaną z tyłu głowy informację o $tau$:
$ (frac(d u, d phi))^2 = frac(1, b^2) -(1-u)u^2. $
Bez trudu wyciągniemy też informację o drugiej pochodnej $u$:
$ 2u'(phi)u''(phi) = -2u + 3u^2 $
$ u''(phi) = -u + frac(3, 2) u^2=u(frac(3, 2)u-1), $
bo $u'=c=1$ w naszym układzie. Stąd widać, że $u=0$ oraz 
$ frac(2, 3)=u=frac(1, r) => r = frac(3, 2) $ 
są punktami przegięcia funkcji $u(phi)$. Dalej, dla 
$ frac(2, 3)< u = frac(1, r) => r < frac(3, 2) $ 
pochodna $u'(phi)$ powinna być rosnąca, a dla 
$ frac(2, 3) > u=frac(1, r) => r > frac(3, 2) $ 
powinna być malejąca.

Możemy więc obserwować pierwiastki powyższej równości, by sprawdzać, kiedy $r(phi)$ jest stałe. Co więcej, możemy również sprawdzić przy jakim położeniu foton zapadnie się w czarną dziurę, a kiedy będzie w stanie uciec z jej pobliża.

Równanie wyżej jest równaniem 3 stopnia o rzeczywistych współczynnikach, ma więc ono 3 pierwiastki, co najmniej jeden rzeczywisty i dwa potencjalnie zespolone, sprzężone ze sobą. Możemy oznaczyć je przez $u_1, u_2, u_3$ i zapisać
$ 
  (frac(d u, d phi))^2 &= (u- u_1) (u- u_2) (u-u_3)= \
    &= u^3 - u^2 (u_1 + u_2 + u_3)+ \ 
      &+ u(u_1 u_2 + u_1 u_3 + u_2 u_3) +\ 
        &-u_1 u_2 u_3. 
$

Widzimy więc, że suma pierwiastków odpowiada wyrazowi przy $u^2$ w oryginalnym równaniu, natomiast ich iloczyn jest równy wyrazowi wolnemu:
$ 
  u_1 + u_2 + u_3 = 1
$
$
  -frac(1, b^2) = u_1 u_2 u_3
$
/* 
Warto też zauważyć, że oryginalne równanie nie posiada wyrazu stopnia $1$, czyli 
$ 0= u_1 u_2 + u_1 u_3 + u_2 u_3 $
*/

Z tego wzoru możemy od razu wyliczyć wzór na drugą pochodną
$ (u'(phi))^2 = (u-u_1)(u-u_2)(u-u_3) $
$ u''(phi)u'(phi) = frac(1, 2)[(u-u_2)(u-u_3) + (u-u_1)(u-u_2) + (u-u_1)(u-u_3)] $
gdzie możemy sprawdzać jej wartość w punktach ekstremalnych funkcji $u(phi)$.

Zacznijmy od przypadku gdy $u_1 < u_2 < u_3$ są wszystkie liczbami rzeczywistymi. Wtedy dla $u_2 < u < u_3$ oraz $u < u_1$ funkcja $(u-u_1) (u-u_2) (u-u_3)$ jest ujemna, co daje zespoloną wartość dla $u'(phi)$. 

Jeśli teraz $u_1$ będzie jedynym pierwiastkiem rzeczywistym, a $u_2$ i $u_3$ będą sprzężonymi ze sobą pierwiastkami zespolonymi. W takim przypadku jedyny pierwiastek rzeczywisty musi być ujemny, bo wtedy
$ -frac(1, b^2) = u_1 u_2 u_3 = u_1 u_2 overline(u_2) = u_1 ("Re"(u_2)^2 + "Im"(u_2)^2) $
gdzie $b^2$ oraz $"Re"(u_2)^2+"Im"(u_2)^2$ są zawsze dodatnimi wartościami.

W takim razie $u_1$ będzie orbitą, z której fotony nie zapadają się, ale też nie mają szansy wypaść z okolic czarnej dziury. Z racji tego jak wyglądają czarne dziury, możemy z dużą dozą prawdy stwierdzić, że 
$ u_1>r_s=1. $ 
W takim razie $"Re"(u_2)="Re"(u_3)<0$.

