# The Server target

The Server target builds a `zip` for easy server setup.
It comes with a python install script to set up the server and download all mods.
After extracting the server, run

```sh
python install_server.py
```

to install the server and download all mods.
You can then start it using `./run.sh` on Linux or `.\run.bat` on Windows.
There is also a `Dockerfile` that allows running the server in a Docker container.
