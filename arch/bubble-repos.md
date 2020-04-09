# Bubble Repositories

## [bubble](https://git.bubblev.org/bubblev/bubble)
The primary repository, contains the code for the Bubble API. Building this repository will build everything you need to start a local Bubble Boot Launcher, from which you can fork a proper cloud-based Bubble Launcher, which can then launch individual Bubbles.

This repository contains:
 * `automation`: the ansible roles to setup a new Bubble
 * `bubble-server`: the Bubble API
 * `bin`: scripts for working with Bubbles, including convenience scripts for working with the Bubble API 
 * `bubble-web`: a submodule containing the front-end UI code
 * `utils`: utility code submodules 

### bubble submodules

#### [bubble-web](https://git.bubblev.org/bubblev/bubble-web)
The frontend user interface, built in VueJS. 

#### utils/[abp-parser](https://git.bubblev.org/bubblev/abp-parser)
Parser logic for AdBlockPlus-formatted filter files. Used by the BubbleBlock app.

#### utils/[cobbzilla-parent](https://git.bubblev.org/bubblev/cobbzilla-parent)
Utility code that defines package versions for various dependencies

#### utils/[cobbzilla-utils](https://git.bubblev.org/bubblev/cobbzilla-utils)
General utility code, used throughout bubble, and by other utility code

#### utils/[cobbzilla-wizard](https://git.bubblev.org/bubblev/cobbzilla-wizard)
A long-ago fork of DropWizard, cobbzilla-wizard is a simple framework for building Jersey/JAX-RS APIs

#### utils/[restex](https://git.bubblev.org/bubblev/restex)
A library used in testing to generate API documentation

#### utils/[templated-mail-sender](https://git.bubblev.org/bubblev/templated-mail-sender)
A library used to send emails based on templates

## Supporting Repositories
These repositories contain code that is built separately, and then included in `bubble` ansible roles.

### [dnscrypt-proxy](https://git.bubblev.org/bubblev/dnscrypt-proxy)
A fork of https://github.com/DNSCrypt/dnscrypt-proxy.git

The `bubble` branch contains some minor changes to work with Bubble. The built binary is included in the `algo` repository, which is then packged and included in the ansible `algo` role in the `bubble` repository.

### [algo](https://git.bubblev.org/bubblev/algo)
A fork of https://github.com/trailofbits/algo

The `bubble` branch contains some minor changes to work with Bubble, including the `bubble_zip.sh` script, which packages the repository for inclusion in the ansible `algo` role in the `bubble` repository.

### [mitmproxy](https://git.bubblev.org/bubblev/mitmproxy)
A fork of https://github.com/mitmproxy/mitmproxy/

The `bubble` branch contains some minor changes to work with Bubble, including the `bubble_zip.sh` script, which packages the repository for inclusion in the ansible `mitmproxy` role in the `bubble` repository.

### [bubble-nodemanager](https://git.bubblev.org/bubblev/bubble-nodemanager)
A low-level management system for deployed Bubble nodes. Written in [Rust](https://www.rust-lang.org/) for high-performance and a small memory footprint.
The resulting binary is included in the ansible `bubble_finalizer` role in the `bubble` repository.

## Data Repositories
This repository contains data that is used at runtime by a Bubble.
  
### [bubble-filter-lists](https://git.bubblev.org/bubblev/bubble-filter-lists)
Contains filter lists that are loaded (and periodically reloaded) by the BubbleBlock app.

## Documentation Repositories
Bubble documentation.

## [bubble-docs](https://git.bubblev.org/bubblev/bubble-docs)
Contains various documentation about the Bubble project.

