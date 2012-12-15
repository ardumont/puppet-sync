puppet-sync
===========

an orchestrator module to permit to ease the installation of one's machine using puppet.

**Notes**

This is under dev.

# How to dev

There is a Vagrantfile with 2 vms inside:
- One for the master (vm1)
- One for the agent (vm2)

To test, you can start the vms, develop and trigger the sync between master and agent.

## master

### Start

Start the master first.

``` sh
vagrant up vm1
```

### connect

Connect to it

```sh
vagrant ssh vm1
```

### first time

Launch the puppet master

``` sh
/root/bin/puppet-master-start-no-daemon.sh
```

Sync the puppet master the first time

``` sh
/root/bin/puppet-agent-start-no-daemon.sh
```

## agent

### Start

Start the agent.

``` sh
vagrant up vm2
```

### connect

Connect to it

```sh
vagrant ssh vm2
```

### sync

Sync the agent with the master

``` sh
~/bin/puppet-agent-start-no-daemon.sh
```
