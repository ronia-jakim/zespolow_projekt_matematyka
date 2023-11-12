import numpy as np
import matplotlib.pyplot as plt

G = 6.6743015*(10**(-10)) # stała grawitacyjna
C = 299792458             # prędkość światła

def A (pos, rs):
    return 1 - (rs / pos)

# co się dzieje z polem grawitacyjnym g, kiedy chodzimy po kole wokół czarnej dziury
# to znaczy, że czas jest stały, promień i phi się zmienia, theta jest stale równa pi
def g_na_annulusie (mass, r0, phi0, vr, vphi, n):
    
    # promień Schwarzschilda
    rs = 1#(2 * G * mass) / (C**2) 
    print(rs)

    xlst = []
    ylst = []

    r = rs + r0 
    phi = phi0

    x = r * np.cos(phi)
    xlst.append(x)

    y = r * np.sin(phi)
    ylst.append(y)

    i = 0
    
    print(A(r, rs))

    while i < n:
        g = (-A(r, rs) ) + ( ( 1 / A(r, rs) ) * vr * vr ) + r * r * vphi * vphi 

        dx = (r + vr) * np.cos(phi + vphi) - r * np.cos(phi)
        dy = (r + vr) * np.sin(phi + vphi) - r * np.sin(phi)

        x = r * np.cos(phi) + dx - g
        xlst.append(x)

        y = r * np.sin(phi) + dy - g
        ylst.append(y)

        r = np.sqrt(x*x + y*y)
        phi = np.arctan(y / x)

        i += 1

    print(xlst)
    print(ylst)
    
    plt.plot(xlst, ylst)
    plt.show()


g_na_annulusie(10*(30), 2, 20, 5, 5, 30)
    
