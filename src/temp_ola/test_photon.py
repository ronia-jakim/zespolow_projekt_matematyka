from photon import photon, G, M, c
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as anim

import matplotlib.patches as patch

import sys

""" p = photon(1, 1)

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
"""
r_schwarz = (2 * G * M) / c**2


PHOTON_NR = 20
PHOTON_SEP = 1
PHOTON_X = 1
offset = 1

fig, ax = plt.subplots()
xdata, ydata = [], []
xdata2,ydata2= [], []

photons = [] 
ll = []


for i in range(0, PHOTON_NR):
    photons.append(photon(PHOTON_X, offset + PHOTON_SEP * i))
    
    ln, = plt.plot([], [])
    ll.append(ln)

Time = 10
dt   = 0.01
for p in photons: 
    p.move(Time, dt)

def init():
    upper_lim = (1.5 * offset) + PHOTON_SEP * PHOTON_NR
    
    ax.set_xlim(-0.5*upper_lim, offset + PHOTON_X)
    ax.set_ylim(-offset, upper_lim)
    # ax.set_xlim(-1, 7)
    # ax.set_ylim(-1, 7)
    return ll #,ln2

def update(frame):
    for i in range(0, PHOTON_NR):
        p = photons[i]

        xdata = p.pathx[:frame]
        ydata = p.pathy[:frame]
        ll[i].set_data(xdata, ydata)

    #xdata2 = p2.pathx[:frame]
    #ydata2 = p2.pathy[:frame]
    #ln2.set_data(xdata2,ydata2)
    
    return ll #,ln2

def do_animation() :
    ani = anim.FuncAnimation(fig, update, repeat=True, frames=len(np.arange(0, Time, dt)), interval=20,
                    init_func=init, blit=True)
    circle = patch.Circle((0, 0), r_schwarz, color = 'black')
    ax.add_patch(circle)

    writer = anim.PillowWriter(fps=15, metadata=dict(artist='Me'), bitrate=1800)
    #ani.save('./test_photon_animation.gif', writer=writer)
    plt.show()

def do_static_graph() :
    init()
    circle = patch.Circle((0, 0), r_schwarz, color = 'black')
    ax.add_patch(circle)
    
    for p in photons:
        plt.plot(p.pathx, p.pathy)
    
    plt.xlabel('')
    plt.ylabel('')
    plt.title(f'ścieżki fotonów w pobliżu czarnej dziury o masie {M}')

    plt.savefig('../../latex/ilustracje/photon_path_1.png')


if sys.argv[1] == "animacja":
    do_animation()
elif sys.argv[1] == "rysunek":
    do_static_graph()
else: 
    print("Próbowano wywołać program z argumentem" + str(sys.argv[1]))
    print("Dostępne polecenia to:")
    print("   animacja - by odtworzyć animację oraz zapisać ją do pliku")
    print("   rysunek  - by otrzymać statyczny graf prezentujący ścieżki fonotnów")
