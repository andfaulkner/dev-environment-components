---
---
# Imports
---

---

---

# How imports work

-   Import statements are executed in 2 steps:
    1.  Find a module, and initialize it if necessary
    2.  Define name(s) in local namespace of scope where import statement occurs.
-   From a file system perspective, packages are directories and modules are files

---

---

# Example imports

With:

```
import nanofactory_web

# import python_services
from nanofactory_web import python_services

# from python_services import network_graph
from nanofactory_web.python_services import network_graph

from nanofactory_web.python_services.network_graph.handle_graphml import handle_graphml_file
```

...these will then work:

```
print("nanofactory_web:", dir(nanofactory_web))
print("nanofactory_web.python_services:", dir(nanofactory_web.python_services))
print("python_services:", dir(python_services))
print("network_graph:", dir(network_graph))
print("nanofactory_web.python_services:", dir(nanofactory_web.python_services))
print("handle_graphml_file:", dir(handle_graphml_file))
```

---

---

# Get PYTHONPATH

These are the root sources of imports.
Each child directory of each directory in PYTHONPATH can be imported if it
contains an `__init__.py` file - even if it's empty.

```
import sys
print(sys.path)
```
