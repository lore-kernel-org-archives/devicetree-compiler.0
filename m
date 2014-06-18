From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: dtc crash when compiling a test file
Date: Tue, 17 Jun 2014 17:28:35 -0700
Message-ID: <CAPnjgZ3pdOGOAO6ktY7gd696wUtA0zHgpcg-GZZxA8yfvHkHyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:cc:content-type;
        bh=tK3t9+E/XQeQwf+TKQuOZ22i2a6DkhZdIGzygL9hdBs=;
        b=BcXYHLBPa7m62D6SxDSK+8npRYoBfSyqMuXeTTqNnunWDO5MNbb9/8uXB6Ktm/Q4nm
         BIzC4t3ZtYguov/k0hSp8RU02JB+frdI9fkaUuowhCA1iUolQ4FNv4QfPBeLvPu2ReZ/
         +Uvw5C03a5Q3xTn+3f+g2GjOvr7JYUXWW3wgzRzctn+NLAsTrafFXbJxqgfKjobxRJrv
         fPRXwLxvJZthp/78Fhqnt+LFjVP6D+PsWK/ec5iCbi9v/EMOmpj4KAi12TpiJYmkYG8E
         nSLYiwKL34pgVn5/10AD/SZ13ebh+uVWhGYschx3EVVi1hLMqjgtolUQN0pDLOfeWqqY
         RSig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:date:message-id:subject:from:to:cc:content-type;
        bh=tK3t9+E/XQeQwf+TKQuOZ22i2a6DkhZdIGzygL9hdBs=;
        b=kgRjgg1kg6jPWFPrD6iPMMWB/trHnQkvAbGsWUK07lAzO8fcTTrRsh4pE6ANVJrgwB
         xQ+zcupg1QKmokpovxJAEcIT4uIZ0gLbV+36eOa9nPW4pgY58FRrsfSJsciuSuhVtrDM
         /nWg43w06GZigNSvz28jVhvbrEaBtTaYWXbO0=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi,

I noticed the following crash. I'm not offering a patch sorry, but
thought I would report it.

$ dtc tests/label01.dts
/dts-v1/;

/memreserve/ 0x1000000000000000 0x0000000002000000;
memrsv2: /memreserve/ 0x2000000000000000 0x0100000000000000;
/memreserve/ 0x0000000000000000 0x0000000000000014;
/ {
model = "MyBoardName";
compatible = "MyBoardName", "MyBoardFamilyName";
#address-cells = <0x2>;
#size-cells = <0x2>;

cpus {
linux,phandle = <0x1>;
#address-cells = <0x1>;
#size-cells = <0x0>;

PowerPC,970@0 {
device_type = "cpu";
reg = <0x0>;
clock-frequency = <0x5f5e1000>;
timebase-frequency = <0x1fca055>;
linux,boot-cpu;
i-cache-size = <0x10000>;
d-cache-size = <0x8000>;
};

PowerPC,970@1 {
device_type = "cpu";
reg = <0x1>;
clock-frequency = <0x5f5e1000>;
timebase-frequency = <0x1fca055>;
i-cache-size = <0x10000>;
d-cache-size = <0x8000>;
};
};

node: randomnode {
dtc: treesource.c:132: write_propval_string: Assertion `m->offset ==
val.len' failed.
prop: string = str: "foo", "stuffstuff\t\t\t\n\n\n"Aborted (core dumped)

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
