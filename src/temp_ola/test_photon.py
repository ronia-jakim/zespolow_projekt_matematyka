from photon import photon, G, M, c
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as anim

p = photon(1, 1)

fig, ax = plt.subplots()
scat = ax.scatter(p.position[0], p.position[1])
ax.set(xlim=[-1.2, 1.2], ylim=[-1.2, 1.2])

Time = 10
dt   = 0.01
p.move(Time, dt)

def animation(j):
    x = p.pathx[:j]
    y = p.pathy[:j]
    data = np.stack([x, y]).T
    scat.set_offsets(data)
    return scat


animate = anim.FuncAnimation(fig=fig,
                            func = animation,
                            frames = len(np.arange(0, Time, dt)),
                            interval = 20
                            )

r_schwarz = (2 * G * M) / c**2
print(r_schwarz)
# print(p.pathx)
# plt.scatter(p.pathx, p.pathy)
circle = plt.Circle((0, 0), r_schwarz, color = 'black')
ax.add_patch(circle)
plt.show()
