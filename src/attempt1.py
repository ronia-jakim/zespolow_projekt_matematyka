import numpy as np
import matplotlib.pyplot as plt

G = 6.6743015*(10**(-10)) # stała grawitacyjna
C = 299792458             # prędkość światła

# co się dzieje z polem grawitacyjnym g, kiedy chodzimy po kole wokół czarnej dziury
# to znaczy, że czas jest stały, promień i phi się zmienia, theta jest stale równa pi
def g_na_annulusie (mass, x0, y0, vx, vy):
    
    # promień Schwarzschilda
    rs = (2 * G * mass) / (C**2) 
    print(rs)

    # theta = pi
    # dtheta = 0
    # dt = 1

    dt = 1
    theta = np.pi

    x = x0
    y = y0

    dx = vx
    dy = vy

    xlst = [] 
    ylst = []

    i = 0
    while i < 10: 
        i = i + 1
        
        Rxy = np.sqrt(x**2 + y**2)

        a = 1 - (rs / Rxy)

        g = ( -1 * a * C**2 * dt**2 ) + ((1 / a) * ( (x*dx)/Rxy + (y*dy)/Rxy)**2 ) + ( Rxy**2 * ( (x*dy) / (x**2 + y**2) - (y*dx) / (x**2 + y**2) ) )

        dx = (1 + g) * dx
        dy = (1 + g) * dy 

        x = x + dx 
        y = y + dy 

        xlst.append(x)
        ylst.append(y)

    print(xlst)
    print(ylst)
    plt.plot(xdata = xlst, ydata = ylst)
    plt.show()


g_na_annulusie(10*(30), 20, 20, 15, 15)
    
