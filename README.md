
# TINET: Tiny Network

**!!This is prototype version.!! UI may change without prior notice**

An instant virtual network on your laptop with light-weight virtualization.
Here we introduce the Container Network Simulation tools.
Users can generate,  from the YAML configuration file,
the script to build the L2 container network.
Quickstart guide is provided in [QUICKSTART.md](docs/QUICKSTART.md).
It is tested on Ubuntu 16.04 LTS and later.

## Setup and Usage

Prepare and install CNS like below.
You should install docker before following.
```
$ sudo apt install python3 python3-pip graphviz
$ git clone https://github.com/slankdev/tinet && cd tinet
$ sudo -H pip3 install -r requirement.txt
$ sudo cp bin/tn /usr/local/bin/tn
$ tn version
```

```
usage: tn [-h] [-f SPECFILE] [-H HOST] [--project-name PROJECT_NAME]
          [--verbose] [--dry-run]
          {ps,up,down,pull,exec,build,conf,upconf,reconf,reup,version,test,init,img}
          ...

positional arguments:
  {ps,up,down,pull,exec,build,conf,upconf,reconf,reup,version,test,init,img}
    ps                  List services
    up                  Create and start containers
    down                Stop and remove containers
    pull                Pull service images
    exec                Execute a command in a running container
    build               Generate a Docker bundle from the spec file
    conf                Execute config-cmd in a running container
    upconf              Create, start and config
    reconf              Stop, remove, create, start and config
    reup                Stop, remove, create and start
    version             Show the tinet version information
    test                Execute tests
    init                Generate template spec file
    img                 Generate topology png file

optional arguments:
  -h, --help            show this help message and exit
  -f SPECFILE, --specfile SPECFILE
  -H HOST, --host HOST
  --project-name PROJECT_NAME
  --verbose
  --dry-run
```

Running on VM
```
##XXX: if cns will be running on VM
$ sudo apt install linux-image-extra-virtual
```

## Author and Licence

This is just a hobby project. It does not relate to any activity of my company.
It is developed under the Apache License. Please refer to the `LICENCE`.

- Name: Hiroki Shirokura, IPA ICSCoE
- Email: slankdev [at] coe.ad.jp (replace [at] to @)

