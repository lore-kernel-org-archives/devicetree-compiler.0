From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: potential regression between 1.6.0 and 1.6.1
Date: Thu, 13 Oct 2022 14:05:39 -0500
Message-ID: <CAL_Jsq+xu-A39D2Gp=3PjHMg99T0x0qpyEr9gFtGORbS=xmYCw@mail.gmail.com>
References: <AM6PR10MB2102BC4BB6C50FBC26F10557F3259@AM6PR10MB2102.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665687950;
        bh=PK18Ln5aTYoJ/2PyQ6RZy2RTa0BDTXbxkJUpBefVez8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JKzTdQR1YKJ1AQ1ldmVmFD6hFgNH9W2yc7ieCyUMx4R3kkBF98YAhgzaLkE7mwC7W
         Xl/IWVJtMshUfDCXT1qF5OurTkKIJ1MKk6t7IF0vrqiWXMqU2JkM/yea3IDsEq11YS
         Te/AM1ngUgfWvzrvCQnoGYbfbQUSLz/WB8mb/3jspYDuyZ3cEkapuaNTLc6HZWOBWT
         H1kIzr5iYiL/EudlSAOu7n0IoxlZF2fzQGfrzbpSrohiVhXVQbT4mbOnNhFRRT9YOl
         Paf4IXnsVZZHyhmU94TKi2hw4y8X3nXBbGjolO27dvHEi1TVuDLriRVmSJJjw8GBlP
         ui0sB8U6lr9sg==
In-Reply-To: <AM6PR10MB2102BC4BB6C50FBC26F10557F3259-OJ87te00+/XMgFqG8zH1DbUAtUbAAahqZmpNikb/MY7jO8Y7rvWZVA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Quentin Kaiser <quentin.kaiser-JH/mD2RVu8LQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Oct 13, 2022 at 11:36 AM Quentin Kaiser
<quentin.kaiser-JH/mD2RVu8LQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi,
>
> We identified a =E2=80=9Cregression=E2=80=9D between dtc 1.6.0 and 1.6.1 =
introduced by commit 9d7888cbf19c2930992844e69a097dc71e5a7354.

It's always good practice to Cc the author of the commit and quote the subj=
ect.

> As part of a firmware extraction framework that we built and open sourced=
 (https://unblob.org), we have integration test files making sure our chang=
es do not modify the way we extract specific file types.
> We do so by extracting integration test files and identifying changes usi=
ng diff. Within this extraction framework, we have a handler that convert D=
TBs to DTS using the dtc command line tool.
>
> The test suite was failing on one of our colleague=E2=80=99s machine but =
not on ours, and we identified that the only difference was the DTC version=
 (1.5.0 vs 1.6.1).
>
> You can reproduce it with the iMX6 Sabrelite DTB file available at https:=
//github.com/FAlinux-SoftwareinLife/silfa/blob/master/OS/kernel/imx6q-sabre=
lite.dtb using this command:
>
> dtc -I dtb -O dts imx6q-sabrelite.dtb 2>/dev/null | grep min-voltage
>
> Here=E2=80=99s a diff showing the difference between the two generated DT=
S (one with 1.5.0, the other with 1.6.1):
>
> diff /tmp/1.5.0.dts /tmp/1.6.1.dts
> 852c852
> <                       regulator-min-microvolt =3D <0xc3500>;
> ---
> >                       regulator-min-microvolt =3D "\0\f5";
> 859c859
> <                       min-voltage =3D <0xc3500>;
> ---
> >                       min-voltage =3D "\0\f5";

.dts output encoding from a dtb is a guess at best and is not
reliable. Anything that looks like ascii is going to get output that
way. That said, while a \0 at the start is a valid string in dts, it's
probably not likely in practice and we should not decode the data as
ascii in that case.

Rob
