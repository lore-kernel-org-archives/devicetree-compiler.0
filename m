From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] Add a libfdt function to write a property placeholder
Date: Tue, 15 Nov 2016 16:37:17 -0700
Message-ID: <CAPnjgZ10ZR1sycDZYxvQs=sAM9rCV0irXatqMt0KPm-PCkQmYg@mail.gmail.com>
References: <1477353294-15212-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zdLsnuPjldAOodQE/aTNY0f8mBo0+y0KbUZOBBVwGqA=;
        b=fV5WgNErZ2hrgtVJJfk4H3xyDjPSUsC6sUyzHwE8D5JIMIw8AMDxGW3AfwPBNm+ebe
         MqMnfFvSBfab/+A+ISxwMbnhreFEgOVWnqpEtJxuTtlPgzLijekma7K8JEWDpPIxyM1s
         2K/V6xJZ2LwmBQzTLXdAjMUb32vGUMKgmrFWPD7glBkefTV6NpkudvdZmhQJUu8ZQIHP
         s+IwTq3zAbly69L67nSgGnck+9H207qaoznCFVpdHVM8PRbhCmIsAufSKnd26eyx7j44
         siwXWqXVMfxIq6JlCnkkLiHTFqsfy+XOoqRuajnQr7y14VBCTGkxKhQaToeyy5vmKjIq
         qX8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zdLsnuPjldAOodQE/aTNY0f8mBo0+y0KbUZOBBVwGqA=;
        b=ie6diL3FSJ5SUYCOsxs0U9MiRtfyNFtC2DF48O33BI/wPGZHptMGwoOVh8iOvtkCp9
         1ZWthIehfUtwPDT9bFB0A7U3RU4QQ8pwbdjgjdjLi9QYUWJpk15kXxBJNZBPXKbq7qbZ
         sW1opgHqEyi3Kfi9Ig639I9NewmRUceKB8plQ=
In-Reply-To: <1477353294-15212-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi David,

On 24 October 2016 at 17:54, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> The existing function to add a new property to a tree being built requires
> that the entire contents of the new property be passed in. For some
> applications it is more convenient to be able to add the property contents
> later, perhaps by reading from a file. This avoids double-buffering of the
> contents.
>
> Add a new function to support this and adjust the existing fdt_property() to
> use it.
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>
> Changes in v2:
> - Add tests
>
>  libfdt/fdt_sw.c                    | 16 ++++++++++++++--
>  libfdt/libfdt.h                    | 16 ++++++++++++++++
>  tests/include7.dts                 |  1 +
>  tests/sw_tree1.c                   |  5 +++++
>  tests/test_tree1.dts               |  1 +
>  tests/test_tree1_label_noderef.dts |  1 +
>  tests/trees.S                      |  2 ++
>  7 files changed, 40 insertions(+), 2 deletions(-)

Did you see this one?

Regards,
SImon
