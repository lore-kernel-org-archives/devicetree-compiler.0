From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 0/6] Makefile: Tidy up of-platdata file generation rules
Date: Thu, 25 Mar 2021 06:40:47 +1300
Message-ID: <20210324174053.4180445-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7eVGMvVm4Mi0IDCkRg7qSJ/mdwXoIeLUuICLf2CLJGE=;
 b=bFL8M0y3mnCzo+5KZABDNHFUEKrZhBZRNpdJuSGi+/3AtL6TK7z7EtNrnP3u/hSqOK
 3pGmruD2E6MX+wHW0crfjCDhhtTr30JBUr3zRY4HkOKMfMNQF8Pdtx77rjtCLVhDvFqY
 1bTYi+RCBkaE/2P066UpDeeGBE1eCNBugzBdE=
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <https://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Andre Przywara <andre.przywara@arm.com>, Bin Meng <bmeng.cn@gmail.com>, Dalon Westergreen <dalon.westergreen@intel.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Masahiro Yamada <masahiroy@kernel.org>, Walter Lozano <walter.lozano@collabora.com>

The recent of-platdata implementation has caused an occasional error in
CI, possibly due to the transition between !OF_PLATDATA_INST and
OF_PLATDATA_INST.

The problems seems to be due to a generated file (C or object file) not
being regenerated when the setting changes.

This series take two steps aimed at correct this problem.

Firstly it makes the set of files generated (in each case) mutually
exclusive, except for the header files which remain common. This means
that the build will fail if new files are not generated when the setting
changes.

Secondly it removes the old generated files before building new ones,
since that could trip things up if the flag changes back again in a
subsequent build.

In addition, dtoc is currently running on every of-platadata build, even
if nothing has changed. Also pylibfdt is always built due to a change in
file naming with Python 3. Both of these problems are fixed.

Changes in v2:
- Adjust tag so this patch doesn't got to dtc list
- Add a comment to the endif
- Only remove the old (and to be unused) files, so avoid confusing make

Simon Glass (6):
  libfdt: Tidy up pylibfdt build rule
  Makefile: Avoid running dtoc every time
  Makefile: Depend only on required of-platdata files
  dtoc: Only generate the required files
  Makefile: Use a variable for generated of-platdata headers
  Makefile: Remove old of-platdata files before regenerating

 scripts/Makefile.spl          | 43 ++++++++++++++++++++++++-----------
 scripts/dtc/pylibfdt/Makefile |  8 +++++--
 tools/dtoc/dtb_platdata.py    | 23 +++++++++++++++----
 tools/dtoc/test_dtoc.py       |  2 +-
 4 files changed, 56 insertions(+), 20 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

