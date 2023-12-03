from scipy.constants import c, pi
import numpy as np
import matplotlib.animation as anim 
import matplotlib.pyplot as plt

G, M = 10**-8, 1

def runge_kutta_4(f, g, x0, y0, T, h):
    T_d = np.arange(0, T, h)

    X = [x0]
    Y = [y0]

  
    for t in T_d:
        x_n = X[-1]
        y_n = Y[-1]

        k1 = f(t, y_n, x_n)
        l1 = g(t, y_n, x_n)

        k2 = f(t + (h/2), y_n + (h/2) * k1, x_n + (h/2) * l1)
        l2 = g(t + (h/2),  y_n + (h/2) * k1, x_n + (h/2) * l1)

        k3 = f(t + (h/2), y_n + (h/2) * k2, x_n + (h/2) * l2)
        l3 = g(t + (h/2), y_n + (h/2) * k2, x_n + (h/2) * l2)

        k4 = f(t + h, y_n + h * k3, x_n + h * l3)
        l4 = g(t + h, y_n + h * k3, x_n + h * l3)

        x_next = x_n + (h/6) * (l1 + 2*l2 + 2*l3 + l4)
        y_next = y_n + (h/6) * (k1 + 2*k2 + 2*k3 + k4)

        X.append(x_next)
        Y.append(y_next)

    return X[:-1], Y[:-1]

class photon():
    def __init__(self, theta, r) -> None:
        self.position = (r * np.cos(theta), r * np.sin(theta))
        self.velocity = (1, 0)
        self.pathx = []
        self.pathy = []
        self.angle = theta
        self.radius = r
        self.dead = False

    def kill(self) -> None:
        self.dead = True

    def move(self, T, step) -> None:
        # v = ds/dt
        if not self.dead:
            r_equation = lambda t, theta, r: (t / r) * (1 - ((2 * G * M )/r))
            theta_equation = lambda t, theta, r: -((theta * r_equation(t, theta, r)) / 2 * r)
            rs, thetas = runge_kutta_4(r_equation, 
                                                   theta_equation, 
                                                   self.position[0], 
                                                   self.position[1], 
                                                   T, step)
            
            self.pathx = rs * np.cos(thetas)
            self.pathy = rs * np.sin(thetas)
            self.position = self.pathx[-1], self.pathy[-1]
            

