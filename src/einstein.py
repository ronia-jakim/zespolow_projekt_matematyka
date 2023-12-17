import numpy as np

from einsteinpy.geodesic import Timelike
from einsteinpy.plotting.geodesic import StaticGeodesicPlotter

position = [40., np.pi / 2, 0.]
momentum = [0.5, 0., 0.5]
a = 0.
steps = 5500
delta = 1.

geod = Timelike(
    metric="Schwarzschild",
    metric_params=(a,),
    position=position,
    momentum=momentum,
    steps=steps,
    delta=delta,
    return_cartesian=True
)

sgpl = StaticGeodesicPlotter()
sgpl.plot2D(geod, coordinates=(1, 2))
#sgpl.plot2D(geod, coordinates=(2, 3))
sgpl.show()

