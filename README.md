# params_resharding Pre-compiled Package

This is a pre-compiled params_resharding module package that supports multiple Python versions.

## Supported Versions

- Python 3.8 (x86_64)
- Python 3.9 (x86_64)
- Python 3.10 (x86_64)
- Python 3.11 (x86_64)

## Quick Installation

```bash
# Clone the repository
git clone params_resharding_release
```

Add the path of `params_resharding_release` to your `PYTHONPATH`
```python
import params_resharding
# Now you can use the params_resharding module
```

## Directory Structure

```
params_resharding_release/
├── params_resharding/          # Python Init file
├── python_38/                  # Python 3.8 compiled results
├── python_39/                  # Python 3.9 compiled results
├── python_310/                 # Python 3.10 compiled results
├── python_311/                 # Python 3.11 compiled results
├── install.sh                  # Automatic installation script
└── README.md                  # This file
```

## Notes

- Only supports Linux x86_64 architecture
- Each .so file can only be used with its corresponding Python version
