
import sys

assert sys.version_info.major == 3

PYTHON_VERSION = sys.version_info.minor
assert PYTHON_VERSION in [8, 9, 10, 11]
if PYTHON_VERSION == 8:
    from .python_38 import *
elif PYTHON_VERSION == 9:
    from .python_39 import *
elif PYTHON_VERSION == 10:
    from .python_310 import *
elif PYTHON_VERSION == 11:
    from .python_311 import *
else:
    raise RuntimeError(f"Error: Unsupported Python version 3.{PYTHON_VERSION}")

from .resharding import resharding_init, resharding_actor_to_inference
from .group_manager import patch_create_group, patch_torch_dist

patch_torch_dist()
patch_create_group()