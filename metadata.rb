maintainer       "Joshua Timberman"
maintainer_email "cookbooks@housepub.org"
license          "Apache 2.0"
description      "Installs pandoc"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5.0"

%w{windows dmg homebrew}.each do |cb|
  depends cb
end

%w{ubuntu debian redhat centos fedora gentoo arch windows mac_os_x}.each do |os|
  supports os
end
