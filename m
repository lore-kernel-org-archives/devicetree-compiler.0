From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 0/2] dtc: Improve checks for i2c reg properties
Date: Thu, 28 May 2020 16:50:35 +0930
Message-ID: <20200528072037.1402346-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ozAlwFH/NsWPPQoM9O+65J2hW1Eu0am6VJ0Xg8vPREI=;
        b=HfZBaRmTcehGAquB+2TCmx4tZEnb6ebfNWxV0Dct73pTOMQgvMrFx16FkJSXtsGbdj
         EqN2wBeTNRT41qrt0ZsrFn1R20Nm3FoQW6YcN7+2pZVT1WOqTNEpjAKAXoawFZv4JWyE
         nv2xvnOLJce4vsSA4MqHc+KOPRNT6xFAdWAO8KISoW10pj5KYY3wiS7rq3foJu70yznb
         T1GrguuGmYsInwugN5b8FzbsRGczidcHuc9jK0lrstw3Vbwc7HPUi0Jxge+5RIZB4I9p
         pbfDrd3eWPejCWItVGBynN/th9a79enJ+Vse6vVP74pcRtpuwOBAsPWp7QanUVYakYwU
         k1xw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

This is to fix a build warning in the Linux kernel caused by dtc
incorrectly warning about I2C_OWN_SLAVE_ADDRESS.

v2 contains a second patch to check for 10 bit vs 7 bit addresses.

Joel Stanley (2):
  checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
  checks: Improve i2c reg property checking

 checks.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.26.2

