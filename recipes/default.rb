#
# Cookbook Name:: pandoc
# Recipe:: default
#
# Copyright 2011, Joshua Timberman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when "windows"
  windows_package "pandoc" do
    source node['pandoc']['exe_url']
    checksum node['pandoc']['exe_checksum']
    action :install
  end
when "mac_os_x"
  case node['pandoc']['osx_install_method']
  when 'dmg'
    dmg_package "pandoc-#{node['pandoc']['dmg_version']}" do
      source node['pandoc']['dmg_url']
      checksum node['pandoc']['dmg_checksum']
      type "pkg"
      dmg_name "pandoc-#{node['pandoc']['dmg_version']}"
      volumes_dir "pandoc #{node['pandoc']['dmg_version']}"
    end
  when 'brew'
    package "haskell-platform" do
      notifies :run, "cabal update", :immediately
    end
    execute "cabal update" do
      action :nothing
    end
    execute "cabal install pandoc" do
      not_if "pandoc -h"
    end
  end
else
  package "pandoc" do
    package_name value_for_platform(
      "arch" => { "default" => "haskell-pandoc" },
      "gentoo" => { "default" => "app-text/pandoc"},
      "default" => "pandoc"
    )
  end
end
