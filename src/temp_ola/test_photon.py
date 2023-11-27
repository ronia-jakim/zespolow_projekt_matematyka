from photon import photon
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as anim

p = photon(5, 5)
dt = 0.01
for t in np.arange(0, 5, dt):
    p.move(dt)

fig, ax = plt.subplots()

line2 = ax.plot(p.pathx[0], p.pathy[0])[0]

def animation(j):
    line2.set_xdata(p.pathx[:j])
    line2.set_ydata(p.pathy[:j])
    return line2


animate = anim.FuncAnimation(fig=fig,
                            func = animation,
                            frames = len(np.arange(0, 5, dt)),
                            interval = 200
                            )

plt.show()
