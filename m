From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/3] dtc: simplify command line invocation
Date: Tue, 26 May 2015 00:11:20 +0100
Message-ID: <1432595483-26153-1-git-send-email-osp@andrep.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

most of time I find myself converting .dts to .dtb files and vice
versa, but having to explicitly specify -I and -O every time seems to
be unnecessary. The file names usually have proper extensions, also
a DTB file is easily recognized by its magic.
This series aims to make life easier, by trying to auto-detect the
file types if no explicit -I or -O parameters have been given.
The behaviour with explicit file types specified via these parameters
is not changed.
For details see the respective commit messages.

If that does not sound entirely stupid, I'd like to ask for these
patches to be merged.

Cheers,
Andre.

Andre Przywara (3):
  guess input file format based on file content or file name
  guess output file format
  Allow a second parameter to be the output file name

 dtc.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 5 deletions(-)

-- 
1.8.4
