pkgname=st
pkgver=0.8.2
pkgrel=10
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=(git)
url=https://st.suckless.org
source=("$pkgname-$pkgver::git+https://git.suckless.org/st#commit=28ad288"
#https://st.suckless.org/patches/clipboard/st-clipboard-0.8.2.diff
#https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.2.diff)
#https://st.suckless.org/patches/gruvbox/st-gruvbox-light-0.8.2.diff
#https://st.suckless.org/patches/xresources/st-xresources-20190105-3be4cf1.diff
#https://st.suckless.org/patches/scrollback/st-scrollback-20200504-28ad288.diff
#https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff
#https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20191024-a2c479c.diff
28ad288.patch)
sha256sums=(SKIP
"9d4cc17c72c4de2309428e34a5395d9eeeee5160741dd8d5aa61791ef68862b8")
_sourcedir=$pkgname-$pkgver
_makeopts="--directory=$_sourcedir"

prepare() {
  patch --directory="$_sourcedir" -p1 < 28ad288.patch
}

build() {
  make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README"
  install $installopts "$shrdir/$pkgname" "$_sourcedir/st.info"
}
