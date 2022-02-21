# esys-escript with viu and pyvista

## What is esys-escript?
The ![esys.escript softwarew](https://github.com/esys-escript/esys-escript.github.io) is a module for implementing mathematical models in python using the finite element method (FEM). The underlying core libraries are written in C++.

## What have we added
The original ![official docker image](https://hub.docker.com/r/esysescript/esys-escript) does contains many tools that can be used for post-processing results, however we need two tools that were missing:

- `pyvista` -  a python package that uses matplotlib under the hood and creates standard bitmap files like png's: https://docs.pyvista.org/
- `viu` - This is a command line tool for displaying bitmaps in the console. We often work on remote servers via ssh and I don't want to download images to my machine before viewing them. Viu allows me to have rough idea of what is going on on the server: https://github.com/atanunq/viu

The Dockerfile creates an intermediate image which downloads and updates cargo. Then viu is installed. For the final image the viu binary is copied and pyvista is installed alongside with libraries for background rendering.

## License

The Dockerfile and all other files in this repositry were released under "The Unlicense" in 2022 by Sebastian Langer.
