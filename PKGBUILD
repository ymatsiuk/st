pkgname=st
pkgver=0.8.2
pkgrel=10
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=(git)
provides=("st")
conflicts=("st")
url=https://st.suckless.org
source=(
    "$pkgname-$pkgver::git+https://git.suckless.org/st#commit=28ad288"
    clipboard.diff #https://st.suckless.org/patches/clipboard/st-clipboard-0.8.2.diff
    scrollback.diff #https://st.suckless.org/patches/scrollback/st-scrollback-20200504-28ad288.diff
                    #https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff
                    #https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20191024-a2c479c.diff
    https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.2.diff
    https://st.suckless.org/patches/xresources/st-xresources-20190105-3be4cf1.diff
    https://st.suckless.org/patches/anysize/st-anysize-0.8.1.diff
)
sha256sums=(
    SKIP
    c5b51e184b37165f5b12147edc1b733056a64adb14845f14b06e4fa48c5536cc  #clipboard.diff
    ccc66743e1a01084455a56ec3aec62bcf03512206ce78ca0f8b2cc4cb3b9b4e5  #scrollback.diff
    4eb3d5eda53a0a77f7438c575d09909f3f7dc462d12e0e4b9d40a7aa64e01b2e  #st-gruvbox-dark-0.8.2.diff
    71c55b796beebecb5e268405f369122fa5a8cf22d992725f00c6c88fe5895f84  #st-xresources-20190105-3be4cf1.diff
    8118dbc50d2fe07ae10958c65366476d5992684a87a431f7ee772e27d5dee50f  #st-anysize-0.8.1.diff
)
_sourcedir=$pkgname-$pkgver
_makeopts="--directory=$_sourcedir"

prepare() {
  patch --directory="$_sourcedir" -p1 < clipboard.diff
  patch --directory="$_sourcedir" -p1 < scrollback.diff
  patch --directory="$_sourcedir" -p1 < st-xresources-20190105-3be4cf1.diff
  patch --directory="$_sourcedir" -p1 < st-anysize-0.8.1.diff
  patch --directory="$_sourcedir" -p1 < st-gruvbox-dark-0.8.2.diff
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
