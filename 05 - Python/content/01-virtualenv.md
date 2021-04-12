# Python 3
## Python Environment (Virtualenv)

Virtual environments is a way to isolate python projects, is a way to mantain versions and packages in a way that could be reproduced almost everywhere

There are a lot of ways of isolation for python code, [Guide to virtual environments](https://docs.python-guide.org/dev/virtualenvs/) but venv is the most used and native way.

The [venv](https://docs.python.org/3/library/venv.html) package allows us to create this virtual environment.

It's worth notice that venv is going to use your python version, so it's important to install previously the latest version of python before creating a virtual env


[python download page](https://www.python.org/downloads/)


```bash
python --version
python -m venv DIRECTORY
```

Executing this command creates a bunch of files copied into `DIIRECTORY`


```
.
├── bin
├── include
├── lib
└── pyvenv.cfg 
```

- `bin` directory contains all the binary files necessary to run your python environment, its own `pip` installer and some activation scripts to get this working.
- `include` will contaian all the python C libraries and other compilated parts necessary for some modules.
- `lib` contains all the python modules installed via `pip` or `easy_install`.
- `pyvenv.cfg` a bootstrap configuration file

To start using the python virtual environment, we source

```bash
source bin/activate
```

This sets the necessary bash variables for the current bash terminal, if we open a new one, we will need to activate the python venv for the new terms.


For deactivation, just execute:


```bash
deactivate 
```

We use `pip` for installing new packages into the virtual environments.

[pip reference](https://pip.pypa.io/en/stable/reference/)


Using this new environment, we could install a new package, for example:


```bash
pip install requests
```

Or even, install a specific version for a certain package:


```bash
pip install beautifulsoup4==4.9.2
```

If you're done with your python dependencies, you can always freeze your versions:


```bash
pip freeze > requirements.txt
```

And get your dependencies back whenever you want


```bash
pip install -r requirements.txt
```


