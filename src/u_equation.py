import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from math import hypot


def u_derivatives(r, phi):
    return [r[1], -r[0] + (3/2) * r[0] ** 2]


# for i in range(1, 3):
#
#     u, u_der = odeint(u_derivatives, [i, 0], phi).T
#
#     x = 1/u * np.cos(phi)
#     y = 1/u * np.sin(phi)
#
#     plt.plot(x, y)

circle1 = plt.Circle((0, 0), 1, color='black')
fig, ax = plt.subplots(figsize=(5, 5))

phi = np.arange(0, 8, 1e-2)
# start_values = np.arange(1.25, 5, 0.25)
# start_values = np.append(start_values, 1.25)
start_values = np.array([1.25, 1.5, 2, 3, 4])
for i in start_values:
    u, u_der = odeint(u_derivatives, [1/i, 0], phi).T

    x = 1/u * np.cos(phi)
    y = 1/u * np.sin(phi)

    x_stop = np.where(x > 5)[0]
    y_stop = np.where(y > 5)[0]

    if len(x_stop) != 0:
        x_stop = x_stop[0]
        x[x_stop:] = 10

    if len(y_stop) != 0:
        y_stop = y_stop[0]
        y[y_stop:] = 10

    for index, item in enumerate(zip(x, y)):
        if hypot(item[0], item[1]) < 1:
            x[index:] = item[0]
            y[index:] = item[1]

    x[0] = i
    y[0] = -4
    ax.plot(y, x)


ax.set_xlim(-5, 5)
ax.set_ylim(-5, 5)
ax.add_patch(circle1)
plt.show()
