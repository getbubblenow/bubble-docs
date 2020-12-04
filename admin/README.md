# Bubble Administrator's Guide

# Types of Nodes

A "node" in the land of Bubble is, in the most general sense, any system running the Bubble API and associated services.
There are a few types of nodes:
 
## Regular Nodes
A regular node is one that is providing VPN and/or Bubble app processing for an end user and their connected devices.
Regular nodes are launched by other nodes, called Sage Nodes.

## Sage Nodes

Sage Nodes provides secure proxy connections to various cloud services. A regular node establishes a secure, bilaterally trusted
relationship with its Sage Node upon launch. A regular node can have only one Sage Node.

## Peer Nodes (future functionality)
Today, a Bubble network always contains a single node. In the future, a Bubble can be a cluster of peer nodes.
An initial regular node would spawn additional peer nodes in accordance with a cluster policy.

End user devices would choose the closest node based on availability and latency.

Bubble network state is stored in PostgreSQL (persistent data) and Redis (cache data).

In order to support multi-node networks, Bubble will:
  * Add a transparent PostgreSQL pooling technology to provide everywhere-hot-active across all peers. Currently, [Pgpool-II](https://www.pgpool.net/) is looking fairly interesting. Open to other suggestions.
  * Add [Redis cluster](https://redis.io/topics/cluster-tutorial) to keep Redis in sync across peer nodes.
  * Possibly: add [etcd](https://etcd.io/) to share configuration information across nodes.
