import numpy as np
import matplotlib.pyplot as plt

# Constants
G = 6.67430e-11  # gravitational constant in m^3 kg^-1 s^-2
c = 299792458.0  # speed of light in m/s
M = 1.989e30     # mass of the black hole in kg (for example, solar mass)


rate = lambda r: 1 / np.sqrt(1 - ((2 * G * M) / ((c ** 2) * r)))

xx = np.arange(0, 6000, 10)

r_schwarz = (2 * G * M) / (c ** 2)

plt.plot(np.zeros(len(xx)) + r_schwarz, np.linspace(0, 20, len(xx)), c='r', label = 'promień Schwarzschilda')
plt.plot(xx, rate(xx), label = 'dylatacja czasu')
plt.xlim([2000, 6000])
plt.ylim([0, 20])
plt.xlabel('odległość od czarnej dziury [m]')
plt.ylabel('')
plt.legend()
plt.title('Dylatacja czasu w pobliżu czarnej dziury')
plt.show()