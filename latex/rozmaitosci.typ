== Co ma metryka do tensora?

Rozmaitości różniczkowalne pozwalają na badanie różnych obiektów matematycznych przez pryzmat przestrzeni $bb(R)^n$. Mówimy, że $M$ jest rozmaitością różniczkowalną z atlasem, czyli rodziną map, $cal(A)={ (U_alpha, phi_alpha) }$, jeśli
- zbiory $U_alpha$ tworzą otwarte pokrycie $M$
- odwzorowania $phi_alpha:U_alpha arrow overline(U_alpha) subset bb(R)^n$ są homeomorfizmami na otwarte podzbiory $bb(R)^n$, a liczba $n$ jest dobrze określona dla $M$
- dowolne dwie mapy $(U_alpha, phi_alpha)$ i $(U_beta, phi_beta)$ są *gładko zgodne*, tzn. #list(indent:10pt,
  [$U_alpha sect U_beta=emptyset$ lub],
  [mapy przejścia $phi_alpha phi_beta^(-1)$ i $phi_beta phi_alpha^(-1)$ są gładkimi odwzorowaniami pomiędzy podzbiorami $bb(R)^n$.]
)

Dla dowolnego punktu $p in M$ mówimy, że $T_p M$ jest *przestrzenią styczną* w punkcie $p$, czyli przestrzenią zawierającą wektory styczne w tym punkcie. $"TM"$ to z kolei rozłączna suma po wszystkich przestrzeniach stycznych, którą nazywamy *wiązką styczną*. Bardzo ciekawą własnością przestrzeni stycznych jest ich liniowość @leeSmoothManifolds, tzn. dla każdego $p in M$ przestrzeń $T_p M$ jest przestrzenią wektorową wymiaru $n$, a jeśli $(U, phi)$, $phi=(phi_1,...,phi_n)$ jest mapą wokół $p$, to zbiór
$ {frac(diff, diff phi_1),...,frac(diff, diff phi_n)} $
jest bazą $T_p M$.

Liniowość przestrzeni stycznych jest wykorzystywana w celu dodawania rozmaitościom dodatkową strukturę, mianowicie pozwala na definiowanie na wiązce stycznej $M$ odpowiednika iloczynu skalarnego, nazywanego *tensorem metrycznym*. Formalnie, tensor metryczny to rodzina dwuliniowych funkcji
$ g_p:T_p M times T_p M arrow bb(R) $
zdefiniowana w każdym punkcie $p in M$. Każda taka funkcja jest dodatnio określonym iloczynem wewnętrznym na $T_p M$, czyli pociąga za sobą normę 
$ ||v||_p=sqrt(g_p (v, v)). $
Tensor metryczny określony na $T M$ przypisuje więc dwóm wektorom $X_p, Y_p$ zaczepionym w punkcie $p$ rozmaitości $M$ wartość
$ g(X_p, Y_p):= g_p(X_p, Y_p). $

Warto zaznaczyć, że mając bazę dualną ${d phi^i}$ do ${frac(diff, diff phi_i)}$, tensor metryczny możemy zapisać jako
$ g=sum_(i, j <= n) g_(i, j) d phi^i times.circle d phi^j $
gdzie $g_(i, j)$ to wyraz macierzy $g$ zdefiniowanej jako odwzorowanie dwuliniowe wyżej odpowiadający ilorazowi skalarnemu $i$-tego i $j$-tego wektora bazowego.

W niniejszej pracy zajmujemy się tensorem metrycznym Schwarzschilda zdefiniowanym na rozmaitości $bb(R) times (0, +oo) times S^2$ o znakach $(-, +, +, +)$, który jest standardowo zapisywany jako
$ g = -(1 - (r_s) / r ) c^2d t^2 + ( 1 - (r_s) / r )^(-1) d r^2 + r^2(d theta^2 + sin^2(theta) d phi^2) $
lub w postaci macierzy:
$ g_(mu, nu) = mat(
  -(1 - (r_s)/r)c^2, 0, 0, 0;
  0, (1 - (r_s)/r)^(-1), 0, 0;
  0, 0, r^2, 0; 
  0, 0, 0, r^2 sin^2(theta)
  ), $
gdzie $r_s$ to promień Schwarzschilda, a $c$ oznacza prędkość światła @notatkiUoCSD.
