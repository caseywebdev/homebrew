require 'formula'

# Note that x.even are stable releases, x.odd are devel releases
class Libuv < Formula
  homepage 'https://github.com/joyent/libuv'
  url 'https://github.com/joyent/libuv/archive/v0.10.21.tar.gz'
  sha1 '883bb240d84e1db11b22b5b0dfdd117ed6bc6318'

  head 'https://github.com/joyent/libuv.git', :branch => 'master'

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system 'make', 'libuv.dylib'

    include.install Dir['include/*']
    lib.install 'libuv.dylib'
  end
end