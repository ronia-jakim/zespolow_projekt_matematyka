== Proste ścieżki na zakrzywionych powierzchniach - motywacja

Foton poruszający się w przestrzeni kosmicznej nie jest pod wpływem zewnętrznych sił. Jest cząsteczką, na której prędkość nie wpływają zewnętrzne (ani wewnętrzne) siły, więc jego przyspieszenie przez całą podróż przez czasoprzestrzeń wokół badanej czarnej dziury pozostaje równe $0$. 

Oznaczmy przez $"BH"$ rozmaitość opisującą czasoprzestrzeń wokół rozważanej czarnej dziury Schwarzschilda, która zazwyczaj ma postać
$ "BH" = bb(R) times (0,+oo) times S^2 $
Wówczas podróż fotonu jest opisywana przez krzywą
$ gamma:I arrow "BH" $
gdzie $I$ jest pewnym odcinkiem. Ponieważ foton porusza się z prędkością światla i nie przyśpiesza, to wiemy, że $frac(d^2 gamma, d t^2)=0$. Wydaje się, iż dostajemy proste równania różniczkowe opisujące zachowanie funkcji czterowymiarowej.

Niestety, metryka zadana na $"BH"$ mówi nam, że przestrzeń wokół czarnej dziury nie jest do końca taka jak przestrzeń $bb(R)^4$. Jest ona nieco zakrzywiona i to właśnie to zakrzywienie czasoprzestrzeni będzie wpływać na obserwowane przez nas zakrzywienie trasy fotona. Aby zrozumieć to lepiej, wyobraźmy sobie, że foton porusza się wzdłuż równika na sferze $S^2$. Wówczas pomimo, że foton nie przyśpiesza w rozumieniu jego podróży po bardzo zagiętej przestrzeni, to dla obserwatora z zewnętrz jego prędkość cały czas się zmienia:

#import "@preview/cetz:0.1.2"

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0,0), radius: 2, name: "sphere")
    arc((-2, 0), start: 180deg, stop: 360deg, radius: (2, 0.7))
    arc((-2, 0), start: 180deg, stop: 0deg, radius: (2, 0.7), stroke: (dash: "dotted"))

    arc((0, -0.7), start: 270deg, stop: 320deg, radius: (2, 0.7), mark: (end: ">", fill: orange), stroke: (paint: orange, thickness: 2pt))
    line((1.6, -0.4), (1.75, -0.32), mark: (end: ">", fill:orange), stroke: (paint:orange, thickness: 2pt))
    
    circle((0, -0.7), stroke: (paint: orange), fill: orange, radius: 2pt)
  })
]

To zjawisko jest też wyrażone w tym jak różny jest produkt skalarny, czy raczej tensorowy, na badanej przez nas przestrzeni od produktu skalarnego w przestrzeni euklidesowej. Nie jest trudno zauważyć, że tensor metryczny na jednostkowej sferze $S^2$ przedstawia się macierzą
$ g_(mu, nu) = mat(
  1, 0;
  0, sin^2(theta);
) $
lub równoważnie wzorem $"ds"^2 = d theta^2 + sin^2(theta) d phi^2$, który wynika z wyliczenia długości wektora powstałego przez zmianę kąta $phi$ o $d phi$ oraz kąta $theta$ o $d theta$.

Wiemy już, że pomimo braku przyśpieszenia na zakrzywionej czasoprzestrzeni wokół dziury foton będzie sprawiał wrażenie skręcającego. Chcielibyśmy teraz umieć zrekonstruować jak obserwator w $bb(R)^3$ widzi trasę fotonu w otoczeniu $"BH"$ mając tylko początkowe położenie i prędkość cząsteczki. 

