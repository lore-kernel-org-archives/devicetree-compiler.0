From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/6] libfdt: Tidy up pylibfdt build rule
Date: Thu, 25 Mar 2021 20:18:25 -0700
Message-ID: <CAPnjgZ2c2Gwiu3cs=8AEi+bJWAX1k0xGAa2YgSHN8NiK_uGDEA@mail.gmail.com>
References: <20210324174053.4180445-2-sjg@chromium.org> <20210324174053.4180445-1-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:from:in-reply-to:references:date:message-id
         :subject:to:cc;
        bh=IrSlbNhkSrd9yYh4yFeH5OszWkyXQTult9kJ7ipb1sQ=;
        b=fWbiZu9Aa24DqQMpSEdcmEi+mGpWpnNMGmelT+gnqrkJpyHZMDOgGQRWIR+zOadILD
         1jyHc/68WfWkGZxHzGVzTDAFbqvE9qFXod3KvDXKXh2RO1qRGgZOvKa3/UpJYhVb5CFq
         6UIun/o3A6oPiw/vaLlLItMe6YbrdnJb70KXg=
Sender: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20210324174053.4180445-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>

At present the build rule for pylibfdt depends on _libfdt.so but modern
Python versions add a different suffix to the output file, resulting in
something like _libfdt.cpython-38-x86_64-linux-gnu.so

The result is that pylibfdt is rebuilt every time.

Rename the file the standard name so that the rule works correctly. Also
add libfdt.py to the dependencies, so that file is always created if
missing.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Adjust tag so this patch doesn't got to dtc list

 scripts/dtc/pylibfdt/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Applied to u-boot-dm/next, thanks!
