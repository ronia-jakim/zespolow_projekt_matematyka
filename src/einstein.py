from __future__ import division 

import math,scipy.integrate,matplotlib.pyplot 

class EnumError(Exception): def __init__(self,varname,varlist): Exception.__init__(self,varname+" must be one of "+", ".join(varlist))

Reference: https://www.physicsforums.com/threads/using-black-holes-to-time-travel-into-the-future.938858/page-2#post-5943810
