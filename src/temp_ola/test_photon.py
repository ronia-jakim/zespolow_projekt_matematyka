from photon import photon
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as anim

p = photon(5, 5)
dt = 0.01
for t in np.arange(0, 5, dt):
    p.move(dt)

fig, ax = plt.subplots()

line2 = ax.scatter(p.position[0], p.position[1])

def animation(j):
  x = p.pathx[j]
  y = p.pathy[j]
  data = np.stack([x, y]).T
  line2.set_offsets(data)
  
  return line2


animate = anim.FuncAnimation(fig=fig,
                            func = animation,
                            frames = len(np.arange(0, 5, dt)),
                            interval = 200
                            )

plt.show()