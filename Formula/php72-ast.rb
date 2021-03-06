require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ast < AbstractPhp72Extension
  init
  desc "Exposing PHP 7 abstract syntax tree"
  homepage "https://github.com/nikic/php-ast"
  url "https://github.com/nikic/php-ast/archive/v0.1.4.tar.gz"
  sha256 "082380202aecca3709b6b67121024f46c06ed5e00ff966f11523ab853491ed54"
  head "https://github.com/nikic/php-ast.git"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "41749249cf661aac5a8f12ab532e2357b4a8b57472a98faeb0296923e1ca635e" => :sierra
    sha256 "ce038c601ab97ca84a224578cfb56e7fe02bef1bd04e82848cbc033bb99fce95" => :el_capitan
    sha256 "af7a112ba413981c2adcec737948f5225a1697f060bc91bfc44947f96ff23f95" => :yosemite
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig

    system "make"
    prefix.install "modules/ast.so"
    write_config_file if build.with? "config-file"
  end
end
