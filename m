From: Igor Opaniuk <igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org>
Subject: Applying dtb overlays on pre-compiled dtb's
Date: Mon, 27 Feb 2023 16:25:42 +0200
Message-ID: <CAL6CDMFiV0_rmE+gTow0X7Wnj7eS6YDu0Ya7dmNACnL1rRy4_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ThUUAKhQw03bknu08SpELqp/KCt3PxG68XVTBf5z33o=;
        b=BUMbp1rdliPuGl50ZtRNGwATZknx2AX9Anc2AGoOlpXTrHB2vQA9rCCzHl+YnNI5L5
         0KKfqM7TqVC+IbF3cMqfbJyZ6Z0pLdIVT5VAgWcNY1+m86b2wKPm/Gd84YaVdVnWeLxQ
         N86sNe/pNYXDF2W/mFs28kSSH3aHnXa3rfDnsbx2jDhDYl3Yr4QgDNivN4qPc3pzj3PV
         IIqjQ6n9UTEdQRZ47TsyWseLuwYkCdp4xoGb0uJIzwqqRu6VJLEEBJqP2fPqtcFUt369
         pLK4EV0t837LYXuUGvlh3v2qvAWCwDu88BRmK/AIf124AK8bC/nNWsb6b/QtV8AfCF6/
         uhog==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi everyone,

I apologize in advance for the possibly wrong ML for this question.

I'm currently looking for any existing ways of adjusting pre-compiled devic=
e
tree blobs. I know that dtc doesn't have such ability (and obviously its pu=
rpose
is different), but maybe there is something you can recommend in this case
(kind of userland analogy of U-Boot's runtime "fdt apply" cmd).

For instance, I would like to add one property to "/firmware" (its value
 is generated during compile time) node into multiple device tree
blobs built with-in
Linux/U-Boot/TF-A, avoiding any additional intrusive changes to these sourc=
e
trees (so, for example, adding dtsi with needed firmware property
unfortunately doesn't work for me).

The only solution I see is a custom app that uses libfdt, implemented
specifically
for this task, but maybe there is something which already exists.

Thanks and looking forward to your replies.

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Embedded Software Engineer
T:  +380 938364067
E: igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org
W: www.foundries.io
