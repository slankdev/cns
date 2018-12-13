
# CNS: Container Network Simulation tools

Container Network Simulation tools.
User can generate the script to build
the L2 container network from YAML file.
Quickstart is talked at [QUICKSTART.md](QUICKSTART.md).
It is tested on Ubuntu 16.04 LTS and later.

## Setup and Usage

preparation and install cns.
```
$ git clone https://github.com/slankdev/cns && cd cns
$ sudo pip3 install -r requirement.txt
$ sudo cp bin/cns /usr/local/bin
```

usage.
```
$ cd <working_dir>
$ cns                  // show usage
$ cns -h               // show help
$ cns init             // generate init shell-script to stdout
$ cns fini             // generate fini shell-script to stdout
$ cns init | sudo sh   // generate and execute init shell-script
$ cns fini | sudo sh   // generate and execute fnit shell-script
$ cns conf | sudo sh   // generate and execute config shell-script
$ cns tpl              // generate template
$ cns img              // generate network topology image file
```

NEED visualization for Graphviz
```
$ sudo apt-get install graphviz
```

Running on VM
```
##XXX: if cns will be running on VM
$ sudo apt install linux-image-extra-virtual
```

## Author and Licence

This is just hobby project. so it's independ to my company.
This is developed under the Apache License. Please refer thd `LICENCE`.

- Name: Hiroki Shirokura
- Company: NTT Communications, Tech-Dev Division
- Email: slankdev [at] nttv6.jp (replace [at] to @)

