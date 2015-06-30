From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/2] dtc: simplify command line invocation
Date: Wed,  1 Jul 2015 00:31:26 +0100
Message-ID: <1435707088-12800-1-git-send-email-osp@andrep.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

as promised the revised version of my mini-series.
Compared to the first drop I do not bother anymore to do file name
based guessing in case of an error opening or accessing the input
file. Also the .dts heuristic (first character is a '/') is now gone.
I omitted the third patch ("allow a second parameter to be the output
file name") entirely.

Hope that fits better, if not, let me know!

Cheers,
Andre.

-------------

Most of time I find myself converting .dts to .dtb files and vice
versa, but having to explicitly specify -I and -O every time seems to
be unnecessary. The file names usually have proper extensions, also
a DTB file is easily recognized by its magic.
This series aims to make life easier, by trying to auto-detect the
file types if no explicit -I or -O parameters have been given.
The behaviour with explicit file types specified via these parameters
is not changed.
For details see the respective commit messages.

Andre Przywara (2):
  guess input file format based on file content or file name
  guess output file format

 dtc.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

-- 
1.8.4
