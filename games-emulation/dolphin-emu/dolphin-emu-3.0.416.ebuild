EAPI=2
inherit cmake-utils

DESCRIPTION="Gamecube / Wii Emulator"
HOMEPAGE="http://www.dolphin-emulator.com/"
SRC_URI="mirror://sourceforge/palmerdabbelt.u/mirror/dolphin-emu-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/cmake
	sys-devel/gcc
	x11-libs/wxGTK
	media-gfx/nvidia-cg-toolkit
	net-wireless/bluez
	x11-apps/xrandr
	sys-libs/readline
	media-sound/pulseaudio
	media-video/ffmpeg
	>=media-libs/glew-1.5
	>=dev-libs/lzo-2
	>=media-libs/libsdl-1.2"
