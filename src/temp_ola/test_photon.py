from photon import photon
import numpy as np
import matplotlib.pyplot as plt

p = photon(5, 5)
dt = 0.1
for t in np.arange(0, 5, dt):
    p.move(dt)

plt.plot(p.pathx, p.pathy)
plt.show()