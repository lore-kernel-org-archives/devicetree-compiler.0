From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v4 0/2] dtc: Improve checks for i2c reg properties
Date: Mon, 22 Jun 2020 12:40:03 +0930
Message-ID: <20200622031005.1890039-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCGEaLUtYBhXEn7JNjmN2oWTQgcbt6iL1vLrS5rVTKc=;
        b=fpehY4BDBzyf02wswu9An2joG4VflAvdVkIZvDXziYMfCUg6u/2ig2oAg6qNqlWfJR
         osfb0rxEleAxSmKDU++T/0X4Yi91EftpSx2u1K7488F6p2398VBUEOZEPDzIAaKSi2MF
         OUGvwLNJcvZspOzQ8Tf87nn+5KOy1EXlUQ6ZKYiNIbVQcd/PdsMSnCaqUHoUJl2eCK92
         9bZpPSilhxlHaLRXV5hwq0gYtwXkMCLPZ5uVyXhvSV/6CG3oBI/jqg0eCR84x1x4x3sU
         E6CAPbr2DoHVGBqZOqLGLzE6AGc3To4kqrxDdpGuQDztpSVP8mBxgWxTVHyd9zF+SXTv
         c3Ag==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

This is to fix a build warning in the Linux kernel caused by dtc
incorrectly warning about I2C_OWN_SLAVE_ADDRESS.

v4 adds a U to the defines
v3 fixes the 10 bit size check
v2 contains a second patch to check for 10 bit vs 7 bit addresses.

Joel Stanley (2):
  checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
  checks: Improve i2c reg property checking

 checks.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.27.0

