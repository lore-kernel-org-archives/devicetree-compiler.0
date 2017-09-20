From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] dtc: checks for phandle with arg properties
Date: Wed, 20 Sep 2017 17:13:42 -0500
Message-ID: <CAL_JsqLuO24jUO3D_9ROT+tOS6iQEyPGgT8tts7C3bwXPWwskg@mail.gmail.com>
References: <20170901185303.24770-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901185303.24770-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Sep 1, 2017 at 1:53 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> David,
>
> Here's a new version of checks for phandle with arg style properties. This
> checks interrupt and gpio bindings and other common bindings which follow
> the same phandle plus args pattern.
>
> This generates ~200 warnings building the ARM dts files in the kernel.

Ping. Any further comments on this?

Rob
