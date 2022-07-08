FastAPI Base Scaffolding
=============================================================================

<img align="center" width="400" src="./images/fastapi-logo.png"/>

#### Project Lead : | [Matheus Reis](https://github.com/Matheuslr)

### [FastAPI](https://fastapi.tiangolo.com/)

A Simple Scaffold for FastAPI, using [Poetry](https://python-poetry.org/) to manage packages dependencies and virtualenvs.

## Dependencies: 

  |Package | Note |
  |:----|:------------|
  |[Python 3.6+](https://www.python.org/downloads/) | This project uses Python 3.9 but should work on Python 3.6+. |
  |[Poetry](https://python-poetry.org/) | Using Poetry to manage packages dependencies and virtualenvs. |
  |[Pytest](https://pycqa.github.io/isort/) | Test Library |
  |[FastAPI](https://github.com/tiangolo/fastapi) | A Backend framework for python. |
  |[Black](https://pypi.org/project/black/) | Python code formatter.  |
  |[Flake8](https://flake8.pycqa.org/en/latest/) | Style guide enforcement. |
  |[iSort](https://pycqa.github.io/isort/) | Import Sorter. |

### Makefile

1. All commands are described on `Makefile`.
2. to install make, run `apt-get update && apt-get install gcc g++ make`.
3. Run `make help` to get all available commands.

### To run locally
1. Clone this repository.
2. To initialize and install dependencies, run: `make init`
3. Run: `make run-local`
4. In your browser call: [Swagger Localhost](http://localhost:8000/docs)
