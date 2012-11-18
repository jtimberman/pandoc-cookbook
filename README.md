Description
===========

Installs Pandoc.

Requirements
============

## Platforms

* Debian/Ubuntu
* RHEL/CentOS/Fedora
* ArchLinux
* Mac OS X (dmg or brew)
* Windows

## Cookbooks

* windows
* dmg
* homebrew

For installing the pandoc package on Windows and Mac OS X, respectively.

Attributes
==========

* `node['pandoc']['osx_install_method']` - method by which to install
  pandoc on OSX. Default is `dmg`, but if `brew` is specified, it will
  be installed with `package` using the homebrew cookbook's provider.
* `node['pandoc']['dmg_version']` - version number used in the dmg filename.
* `node['pandoc']['dmg_url']` - URL of the DMG default version to
  download for OS X.
* `node['pandoc']['dmg_checksum']` - SHA256 checksum of the DMG default
  version to download for OS X.
* `node['pandoc']['exe_url']` - URL of the EXE installer to download
  for Windows.
* `node['pandoc']['exe_checksum']` - SHA256 checksum of the EXE
  installer to download for Windows.

Recipes
=======

default
-------

Installs pandoc from a package. On Windows, it will use
`windows_package`, on Mac OS X, it will use `dmg_package`, each from
the respective `windows` or `dmg` cookbook.

Usage
=====

Add `recipe[pandoc]` to the node's run list.

Roadmap
-------

Source installation with Haskell's `cabal` package manager to get a
newer release may happen at some point.

License and Author
==================

- Author:: Joshua Timberman <cookbooks@housepub.org>
- Copyright:: 2011, Joshua Timberman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
