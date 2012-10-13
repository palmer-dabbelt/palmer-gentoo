EAPI=4
inherit cmake-utils

DESCRIPTION="Gamecube / Wii Emulator"
HOMEPAGE="http://www.dolphin-emulator.com/"
SRC_URI="http://www.dabbelt.com/~palmer/software/mirror/dolphin-emu-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio"

DEPEND="dev-util/cmake
	sys-devel/gcc
	x11-libs/wxGTK
	media-gfx/nvidia-cg-toolkit
	net-wireless/bluez
	x11-apps/xrandr
	sys-libs/readline
	pulseaudio? ( media-sound/pulseaudio )
	media-video/ffmpeg
	>=media-libs/glew-1.5
	>=dev-libs/lzo-2
	>=media-libs/libsdl-1.2"

src_prepare() {
	epatch "${FILESDIR}/${P}-nullptr.patch"
}
