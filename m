From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/2] scripts: dtc: fix memory leak after realloc
Date: Tue, 12 Apr 2016 16:11:17 -0500
Message-ID: <CAL_JsqKqbj+FmD2SwSsmdBW6SPoJzsP5an1o_XZAozo86ssPCg@mail.gmail.com>
References: <1460494500-26922-1-git-send-email-mussitantesmortem@gmail.com> <1460494500-26922-3-git-send-email-mussitantesmortem@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460494500-26922-3-git-send-email-mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Apr 12, 2016 at 3:55 PM, Maxim Zhukov
<mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This commit fixed memory leak after errors realloc.
>
> Signed-off-by: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  scripts/dtc/fdtput.c | 10 +++++++---

Again, your patch is against the kernel copy of dtc. It needs to be
against upstream dtc and then I can update the kernel copy once this
lands.

Rob
