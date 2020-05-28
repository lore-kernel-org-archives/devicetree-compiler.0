From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3 0/2] dtc: Improve checks for i2c reg properties
Date: Thu, 28 May 2020 18:26:48 +0930
Message-ID: <20200528085650.1417942-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/K44NmJwHDbcFH7pvNpnKvedEgUw2/S/KvNbnvol89M=;
        b=UEmL/qEwh/utJX+gTL52cQFQ9WB8HRll599QVDw+oULxQYN1S02+mQmP1graq5Mljx
         Qusqm42W1w6cKGDuTGssvMOtc1y8HDaqo7WOC4XDDe1ehmZNhUraN2Dh8QOtKHOae4qA
         5vZELWJAM9YX74RnaDT4dW5igfCCofezisVqKyuNYugcScjfqD276V8E92fugPN4yqrm
         WNWHoj3i174mDyIA7pKXaad0iJhP8ny4Of6b1e0kkHI1EOOrd/O772RdaqmEMp2UK7Uz
         wqBC1rp9Ub5NuBLLq3ji6eISCyAByX6OF7Gl9FLoHJXlv2kSy+38sOw25W19EmLaXDtm
         Af6A==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

This is to fix a build warning in the Linux kernel caused by dtc
incorrectly warning about I2C_OWN_SLAVE_ADDRESS.

v3 fixes the 10 bit size check
v2 contains a second patch to check for 10 bit vs 7 bit addresses.

Joel Stanley (2):
  checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
  checks: Improve i2c reg property checking

 checks.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.26.2

