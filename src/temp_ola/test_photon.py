from photon import photon
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as anim

p = photon(2 * np.pi / 5, 3)

fig, ax = plt.subplots()
print(p.position)
scat = ax.scatter(p.position[0], p.position[1])
ax.set(xlim=[-3, 3], ylim=[-3, 3])

Time = 10
dt = 0.1
p.move(Time, dt)

print(p.pathx)

def animation(j):
    x = p.pathx[:j]
    y = p.pathy[:j]
    data = np.stack([x, y]).T
    scat.set_offsets(data)
    return scat


animate = anim.FuncAnimation(fig=fig,
                            func = animation,
                            frames = len(np.arange(0, Time, dt)),
                            interval = 40
                            )

# plt.scatter(p.pathx, p.pathy)
# plt.scatter(0, 0, s = 1000, c = 'black')
plt.show()
