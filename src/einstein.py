import numpy as np

from einsteinpy.geodesic import Nulllike
from einsteinpy.plotting.geodesic import StaticGeodesicPlotter

position = [4, np.pi / 2, 0.]
momentum = [-10., 0., -16.]
a = 0.
steps = 3000
delta = 0.0005


#geod = Timelike(
#    metric="Schwarzschild",
#    metric_params=(a,),
#    position=position,
#    momentum=momentum,
#    steps=steps,
#    delta=delta,
#    return_cartesian=True
#)

omega = 0.01
suppress_warnings = True

geod = Nulllike(
    metric="Schwarzschild",
    metric_params=(a,),
    position=position,
    momentum=momentum,
    steps=steps,
    delta=delta,
    return_cartesian=True,
    omega=omega,
    suppress_warnings=suppress_warnings
)


sgpl = StaticGeodesicPlotter()

sgpl.plot2D(geod, coordinates=(1, 2)) # Plot X & Y
sgpl.show()

