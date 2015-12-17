require 'formula'

class DockerUnisonSync < Formula
  homepage 'https://github.com/typester/docker-unison-sync'
  head  'https://github.com/typester/docker-unison-sync.git', branch: "master"

  depends_on 'unison'
  depends_on 'fswatch'

  def install
    bin.install "docker-unison-sync"
    bin.install "docker-unison-path"
    bin.install "docker-unison-clean"
  end
end

