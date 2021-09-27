From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: dtc 1.6.0 overlay full-path reference in array produces broken
 property names
Date: Mon, 27 Sep 2021 14:04:56 +0000
Message-ID: <20210927140456.4e45f05b@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=/AMnGMuEixj8ORxtYFATKwp77NfV7RSKTLWN/h1YuF8=;
        b=OxbKrYnz8HZtJ7JhJYIeRozvHv96ukSSIRdylzueowUehEBLZlnncTdBTJT0XDrkaL
         ecQBDSjc4DMxE8fEOopLvk79peh7vFzpy4AXhx9fi3BWW0tl1BDcKfG+CrXiXUReBwHm
         O+UIr0bbx3yjY9avDzmv503pOsIjPLjVblzlj2b8rLvwu74mNLiYQhZiIYXggXQRnWoE
         flVas7fxWsaGgZloB2L3uIstSvupz9lZShXEYha0uswak/vINw9v2Tl/oQMx4+y+Khpl
         KTMUgOS05bBNRe1Sq+I+nggbErTGhkLJxpKzVfQ6hy/qYDTgB+vSqWJQ88/4vmR+hwse
         AUQg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

(please keep me cc'ed in replies)

Hello,

I suspect this may be a dtc bug, but I am not too familiar with
devicetree specs to tell.

Here is a simplified example reproducing this issue:

(SNIP)
/dts-v1/;
/plugin/;

/ {
  compatible = "foo";
};

&{/soc/gpio@7e200000} {
    status = "okay";
};

&{/soc/spi@7e204000} {
    cs-gpios = <&{/soc/gpio@7e200000} 8 0x01>;
};
(SNIP)

This code builds fine:
  $ dtc -I dts -O dtb -o test.dtbo test.dts
  $
But then when disassembling the output, I get:
  $ dtc -I dtb -O dts test.dtbo
  <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000: Bad character '/' in property name
  ERROR: Input tree has errors, aborting (use -f to force output)
And forcing output:
  $ dtc -I dtb -O dts -f test.dtbo
  <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000: Bad character '/' in property name
  Warning: Input tree has errors, output forced
  /dts-v1/;

  / {
          compatible = "foo";

          fragment@0 {
                  target-path = "/soc/gpio@7e200000";

                  __overlay__ {
                          status = "okay";
                  };
          };

          fragment@1 {
                  target-path = "/soc/spi@7e204000";

                  __overlay__ {
                          cs-gpios = <0xffffffff 0x08 0x01>;
                  };
          };

          __fixups__ {
                  /soc/gpio@7e200000 = "/fragment@1/__overlay__:cs-gpios:0";
          };
  };

Indeed, the node in __fixups__ has an invalid name.

I suspect this is uncommon because:
- it probably only occurs in overlays and not in self-contained trees,
  as a self-contained tree would likely produce an internal phandle and
  never store the full path anywhere.
- ...which does not attach to labels but full paths
  Labels being (probably ?) valid node names, they would avoid the issue.
- ...in arrays
  In a node overlay, the full path ends up as a quoted string, not as a
  name, so it is safe.

Is this a dtc bug ?


I came up with the following workaround which gets me what I need, but
it is not very nice (extract):

  &{/soc} {
    gpio: gpio@7e200000 {
      #gpio-cells = <0x02>;
    };
    spi: spi@7e204000 {
      #address-cells = <1>;
      #size-cells = <0>;
    };
  };
  ...
  &spi {
      cs-gpios = <&gpio 8 0x01>;
  };

IOW:
- overlay the parent of the nodes I am interested in, just to declare
  labels
- ...while at it, repeat a few of the #... properties, which seem magic
  (this is where my devicetree knowledge ends, really)
- and go on implementing the actual overlays I want, using the
  just-defined labels.

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1
