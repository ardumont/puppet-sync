ENC
===

The ENC installation steps explained.

# Description

## What

Explain how to install an ENC config on an existing Puppet Master.

## Why?

ENC (External Node Classification), allows to externalise the classes affected to the nodes managed by puppet.

## How?

In this particular instance, we will use a configuration stored in a flat file, the file being stored in a git
repository.

# enc-simple-file

## What

This is an enc implementation which only uses file to describe the roles of each node.

## Install

### enc-data

Copy the `enc-data/*` files for each desired nodes.

For example:

``` sh
cp -r /path/to/enc-data /opt/wikeo/
```

or use links:

``` sh
ln -s /path/to/enc-data /opt/wikeo/
```

### enc-simple-file.sh

Install the `enc-simple-file.sh` script:

```sh
sudo cp enc-simple-file.sh /usr/local/bin/enc/
```

Then we need to reference where you place the `enc-data/*` files.

For example:

```sh
DATA_DIR="/opt/wikeo/enc-data/"
```

### puppet.conf

Now we need to tell puppet to use it.

Edit the `/etc/puppet.conf` to reference the `enc.sh` (orchestrator script that calls enc-simple-file.sh)

For example:

``` sh
  external_nodes = /usr/local/bin/enc/enc-simple-file.sh
  node_terminus = exec

```
