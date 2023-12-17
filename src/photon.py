from scipy.constants import c, pi
import numpy as np
import matplotlib.animation as anim 
import matplotlib.pyplot as plt

# # Constants
# G = 6.67430e-11  # gravitational constant in m^3 kg^-1 s^-2
# c = 299792458.0  # speed of light in m/s
# M = 1.989e30     # mass of the black hole in kg (for example, solar mass)

G, c, M = 1, 1, 0.5

def runge_kutta_4(f, g, x0, y0, T, h):
    T_d = np.arange(0, T, h)

    X = [x0]
    Y = [y0]

  
    for t in T_d:
        x_n = X[-1]
        y_n = Y[-1]

        #k1 = f(t, y_n, x_n)
        #l1 = g(t, y_n, x_n)

        k1 = f(x_n)
        l1 = g(x_n)

        #k2 = f(t + (h/2), y_n + (h/2) * k1, x_n + (h/2) * l1)
        #l2 = g(t + (h/2),  y_n + (h/2) * k1, x_n + (h/2) * l1)

        k2 = f(x_n + (h/2) * l1)
        l2 = g(x_n + (h/2) * l1)

        #k3 = f(t + (h/2), y_n + (h/2) * k2, x_n + (h/2) * l2)
        #l3 = g(t + (h/2), y_n + (h/2) * k2, x_n + (h/2) * l2)

        k3 = f(x_n + (h/2) * l2)
        l3 = g(x_n + (h/2) * l2)

        #k4 = f(t + h, y_n + h * k3, x_n + h * l3)
        #l4 = g(t + h, y_n + h * k3, x_n + h * l3)

        k4 = f(x_n + h * l3)
        l4 = g(x_n + h * l3)
        
        x_next = x_n + (h/6) * (l1 + 2*l2 + 2*l3 + l4)
        y_next = y_n + (h/6) * (k1 + 2*k2 + 2*k3 + k4)

        X.append(x_next)
        Y.append(y_next)

    return X[:-1], Y[:-1]

class photon():
    def __init__(self, x, y, b) -> None:
        self.position = (x, y)
        self.pathx = []
        self.pathy = []
        self.dead = False
        self.theta = np.arctan(y/x)
        self.radius = np.sqrt(x**2 + y ** 2)
        self.b = b

    def kill(self) -> None:
        self.dead = True

    def move(self, T, step) -> None:
        r_schwarz = 1
        b = self.b

        r_derivative = lambda r : (1-1/r)*np.sqrt( 1 - (1-1/r) * ((b*b) / (r*r) ) )
        phi_derivative = lambda r : (b * (1-1/r))/(r*r)

        rs, thetas = runge_kutta_4(r_derivative, phi_derivative, self.radius, self.theta, T, step)

        # print(rs)

        for i in range(len(rs)):
            if np.abs(rs[i]) < r_schwarz:
                rs[i:] = np.zeros((len(rs) - i))
                break

        # print(rs)

        self.pathx = np.abs(rs) * np.cos(thetas)
        self.pathy = np.abs(rs) * np.sin(thetas)

        self.position = self.pathx[-1], self.pathy[-1]

        
            

