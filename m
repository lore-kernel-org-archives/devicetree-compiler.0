From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Thu, 24 Nov 2016 14:54:34 +0000
Message-ID: <16bfccad-51b1-0f6c-36ea-fe2d7a19f922@raspberrypi.org>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com>
 <dab7f38a-89c3-adbc-07a5-8ef8669ded42@raspberrypi.org>
 <B341AF38-45C5-4954-B1E4-B89DED923929@konsulko.com>
 <2ad2929c-6e6a-4e31-0cca-cea2f11b14b1@raspberrypi.org>
 <6FE2D679-BD31-4366-B23C-2F95B0706CE0@konsulko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=OsvUpIU0tOVLUeDVI5wWckJlsyburcKAgVtQDYs3Ze0=;
 b=IVc9AVBP0uF4dJESszRM9nerXfnelLwt4Bha8mF1ylqw/saMKYFw4yqIFJgs3ODXCbVt
 9YtenOY0513twtwo+bsXrjYK0jdNF19naX6YQggMC2ygJLmdspO0mVtiKEvyVjyEdlAP
 DEfotE7ktycDYSTJyVBoFfkIz4YBE7cZbusraG1sqiRJwAlTcyA5QyGe/jekNJqaUrOl
 VGNQyIlQ+7HcYvKFtOEecS6KzQgtL1bEMa7+iY75tGXmITKS+Wjhug8llGg3gUgBZMVf
 FREGzyPPnKOXsKTD6jDjn17DkNb79fTSzbzUStu/HcFwyRrkSp3un2mD0uKRG/l/21KN ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=OsvUpIU0tOVLUeDVI5wWckJlsyburcKAgVtQDYs3Ze0=;
        b=eopMALMsbszOfJmW4TcJ6YUpwgq1/w2zZqL9vcfxt3MNgflMQZYr5iYG6qEzOPN7K2
         xmJ8DJ5aoX2ruTqdFVle0HUaCM6n4qMSvcnAB6njtdImfwRS3VzH4pqkQ6YuAWZeLTta
         +8KkcjNw3SFw0SKNODvTfKIPVN+dBFO6Dk/FDHiiMmwMc79xlxVBxWzFT10GALJJ2aNb
         wd3MOUsp6hpNxV/QL2bN6dqrmiQU3oAJ5nAC5BjsLM0pWT8G1sFEn5Gj8Z19DxlwyXFz
         RNEISG5uVhgmME//VoSnmmdTmV1wGAtmu8vBQlHbYAGuYXmzcXPfGe/V/FzznevAvD8k
         920g==
In-Reply-To: <6FE2D679-BD31-4366-B23C-2F95B0706CE0-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 24/11/2016 14:23, Pantelis Antoniou wrote:
> Hi Phil,
>> I would have thought that all DTBs already contain enough dependency
>> information in the form of the phandles themselves. One of the first
>> things the kernel does is to unflatten the DTB, and that is the obvious
>> point to resolve the phandles and generate the necessary dependencies.
>> Can you explain how both __fixups__ and __local_fixups__ aid this
>> process? Ideally they wouldn't duplicate any information already in the
>> tree, since then you have to cope with the possibility of malformed DTBs
>> where the two don't actually match.
> No, the DTBs by themselves do not contain enough information to build the
> probe dependency graph, because phandles are simply converted to 32 bit
> cell values on compile.
>
> For instance take a case of one node using the other:
>
> foo_label: foo { };
> bar { use =3D <&foo_label>; };
>
> A standard compile would generate a bar node as bar { use =3D <1>; };
>
> While using the -@ switch you=92d get a local ref that says that there is
> a phandle cell value at offset 0 of bar/use property. Looking up the
> phandle value you can see that this property references the foo node.
>
> So when building the probe order graph the foo node should be probed
> before bar.
Yes, you are quite right. During compilation the phandleness of a
phandle reference gets lost - it's just an integer. All you really need
is one bit per word, and you could dream up clever coding schemes for
that sparse map, but extra information is needed.

I still think that __fixups__ is unnecessary for base DTBs, but since it
will be empty anyway it just looks a bit awkward rather than taking up
much space.

Seemingly random load order of device nodes has been a cause of
confusion and annoyance, so I'm happy that there is a plan to eliminate
them. If the DTBs have to grow to make that possible then so be it.

Phil
