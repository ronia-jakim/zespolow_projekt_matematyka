from matplotlib.lines import lineStyles
import numpy as np
import matplotlib.pyplot as plt
 
G = 6.6743015*(10**(-10)) # stała grawitacyjna
C = 299792458             # prędkość światła

mass = 10**27

rs = (2 * G * mass) / (C * C)

print(rs)

# theta = pi/2

upper = 300

x = np.linspace(-rs-upper, -rs-1, upper) 
x = np.concatenate([x, np.linspace(rs+1, rs+upper, upper)])

y = np.linspace(-rs-upper, -rs-1, upper) 
y = np.concatenate([y, np.linspace(rs+1, rs+upper, upper)])

x, y = np.meshgrid(x, y)

#print(x)

#g = np.sqrt(np.square(x) + np.square(y))

g = ( 1 / ( 1 - rs / np.sqrt(x*x + y*y) ) ) + (x * x + y * y)
print(np.min(g))

#levels = np.linspace(10000, 200000, 50000)

cp = plt.contour(x, y, g, 20, colors='black')#, linestyles='dashed')

plt.clabel(cp, inline=1, fontsize=10)

cp = plt.contourf(x, y, g, 20)

plt.xlabel('x')
plt.ylabel('y')

th = np.arange(-3.14,3.14,0.01)
r_circle = np.arange(0, rs, 0.5)
for i in r_circle:
    plt.plot( i*np.cos(th), i*np.sin(th), color="white")


plt.plot( rs*np.cos(th), rs*np.sin(th), color="black")

plt.show()
