from scipy.constants import c, pi
import numpy as np

class photon():
    def __init__(self, x, y) -> None:
        self.position = (x, y)
        self.velocity = (1, 0)
        self.pathx = []
        self.pathy = []
        self.angle = pi / 6
        self.dead = False

    def kill(self) -> None:
        self.dead = True

    def move(self, dt) -> None:
        # v = ds/dt
        if not self.dead:
            distance = self.velocity[0] * dt
            old_position = self.position
            self.pathx.append(old_position[0])
            self.pathy.append(old_position[1])
            new_position = (old_position[0] + (distance * np.cos(self.angle)),
                            old_position[1] + (distance * np.sin(self.angle)))
            self.position = new_position

