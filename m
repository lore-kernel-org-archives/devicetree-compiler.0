From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fix libfdt_env.h for RHEL7
Date: Mon, 6 Mar 2017 13:52:54 +0100
Message-ID: <88992ad1-f92f-7006-3b78-6b2e631f4110@redhat.com>
References: <1488558597-21364-1-git-send-email-pbonzini@redhat.com>
 <20170306122557.71669b69@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170306122557.71669b69-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <dgibson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 06/03/2017 02:25, David Gibson wrote:
> I'm not sure which your primary concern is:
> 
> 1) For the RHEL release itself.  I don't think updating the qemu module
> is terribly relevant for this, since we build against the packaged
> libfdt rather than the qemu submodule.  We could ask Mirek to pull the
> define fix into the downstream libfdt package.
> 
> 2) For building upstream qemu on RHEL, using the submodule.  I don't
> have a good answer for this one.

Yes, it is for the submodule.  Because QEMU now requires 1.4.2, the
submodule is needed to compile QEMU on past RHEL releases.  Maybe we can
"#undef __bitwise" or something like that.

Paolo
