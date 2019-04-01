---
---
# pytest
---

---

# Setup

-   Install pytest package:

```
pip install pytest
```

## Turn own project into package

1.  Add setup.py to project root, fill with:

```
from setuptools import setup, find_packages

setup(name="nanofactory_web", packages=find_packages())
```

2.  "Install" own project with:

```
pip install -e .
```

## Config

1.  Add pytest.ini file to project root, then create a `[pytest]` section.
2.  Set `norecursedirs` to avoid certain obvious problem directories:

```
[pytest]
norecursedirs = .mnt build doc logs mock_data node_modules nanofactory shared typings
```

---

---

## Test discovery

-   Searches for tests in directoriies not blocked by `norecursedirs` setting.

-   Collects:
    -   `test`-prefixed test functions e.g. `def test_my_function:`
    -   `test`-prefixed test functions or methods inside `Test`-prefixed test classes
        -   Only grabs those without an **init** method
