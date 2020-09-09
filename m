From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 0/6] Introduce fdt_overlay_merge() to allow merge of overlay blob
Date: Wed,  9 Sep 2020 10:17:56 -0700
Message-ID: <1599671882-310027-1-git-send-email-gurbaror@codeaurora.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Hello Upstream Team,

         This is the second upstream attempt for the fdtoverlay changes and the first attempt can
be found here: https://www.spinics.net/lists/devicetree-compiler/msg01949.html. All of the
issues/comments from the first attempt have been addressed and fixed in this patch.

Changelog:

v1 -> v2: 
- Introduction of new entry point, fdt_overlay_merge(), to handles merging
  overlay blobs (rather than overload that in fdt_overlay_apply()).
- Removed use of printf() in libfdt. snprintf() is still used to help with string
  manipulation.
- Changed the logic to identify fragment nodes.
- Removed use of malloc/calloc and global variables.
- Incorporated a function that copies a node in the overlay tree along with its children and their
properties.

fdt_overlay_apply() API currently allows for an overlay DT blob to be merged
with a base blob. It assumes that all external symbols specified in overlay
blob's __fixups__ section are found in base blob's __symbols__ section and
aborts on the first instance where a symbol could not be found in base blob.

This is mostly fine as the primary use of overlay is on a target for its
bootloader to merge various overlay blobs based on h/w configuration detected?

We are exploring an extended use of fdt_overlay_apply() for offline use, i.e on
the host (build machine) side, which requires merging two overlay DT blobs i.e
the base (overlay) blob will not resolve all the external node references found
in overlay blob.

Currently all the device-tree (DT) code for a given soc is maintained in a
common kernel repository. For example, this common DT code will have code for
audio, video, fingerprint, bluetooth etc. Further this DT code is typically
split into a base (soc-common) code and board specific code, with the soc code
being compiled as soc.dtb and board specific code being compiled as respective
overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
of a given SOC while boardX.dtbo represents configuration of a board/platform 
designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on 
target (besides improving the overall size of DT blobs flashed on target, Android 
Treble also requires separation of soc and board DT bits). Bootloader will pick 
one of the board overlay blobs and merge it with soc.dtb, before booting kernel 
which is presented a unified DT blob (soc + board overlay).

For ease of code maintenance and better control over release management, we are
exploring allowing some of the tech teams (audio/fingerprint sensor etc) to
maintain their kernel code (including their DT code) outside a common kernel
repository. In our experience, this simplifies number of branches maintained in
core kernel repo. New/experimental features in fingerprint sensor driver for
example that needs to be on a separate branch will not result in unnecessary
branching in core kenrel repo, affecting all other drivers.

In addition to compiling DT code outside core kernel tree, we also want to merge
the blobs back to respective blobs found in kernel build tree (soc.dtb or
boardX.dtbo), as otherwise relying on bootloader to do all the overlay impacts
boot-time.

This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
boardX.dtbo), which currently doesn't seem to be supported and which this patch
series aims to support.

Additional notes: 

If snprintf (in libc) may not available in some environments, then we will need
to write our own snprintf() in libfdt.

Srivatsa Vaddagiri (6):
  libfdt: overlay_merge: Introduce fdt_overlay_merge()
  libfdt: overlay_merge: Rename fragments
  libfdt: overlay_merge: Ignore unresolved symbols
  libfdt: overlay_merge: remove resolved symbols
  libfdt: overlay_merge: Copy over various nodes and their properties
  fdtoverlaymerge: A tool that merges overlays

 Makefile             |   3 +
 Makefile.utils       |   6 +
 fdtoverlaymerge.c    | 223 ++++++++++++++++
 libfdt/fdt_overlay.c | 742 +++++++++++++++++++++++++++++++++++++++++++++++++--
 libfdt/libfdt.h      |  18 ++
 5 files changed, 971 insertions(+), 21 deletions(-)
 create mode 100644 fdtoverlaymerge.c

-- 
2.7.4

