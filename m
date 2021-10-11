From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Mon, 11 Oct 2021 08:22:54 -0500
Message-ID: <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633958589;
        bh=vRwxnJNao+Y9O2+tDR121DScdK88DNjj6YJMg1U0X2o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D35AhimOe/rIVb30TjvqSTiWYQ6M/ryuf3eaI9PjGlvzZLDZLJvZwd7mqfH2qiLJ3
         4Q3c0k5KEl9dCrViMpUklkVee4vU0FDsG829c0IJRJ0XP51NHOBvV+N5SJ3OXcJk1g
         4sZZMyUYx3aWcUMSkyNxk6JnRqsjuR5dVDDdzlENxPCfUuU/9I9XvsKP/2Aq3EEt+V
         smaOMGSEXH7R3j8O8EE0eBzdXAnzYgCROx5Y0HH0i1Dnav0VDEGCJ22zXFWCSTKVVA
         aaWfJGoDTyUTUI4j7f1Xtm0wUh2eee1lAR1JkS83feLb6PIkAJWPZwZFUcoj3FepgF
         4rfnNN3K7Y2Ow==
In-Reply-To: <YWPIiqpb3KlwTVN/@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Oct 11, 2021 at 2:19 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > YAML output was restricted to dts input as there are some dependencies
> > on source annotations which get lost with other input formats. With the
> > addition of markers by the checks, YAML output from dtb format becomes
> > more useful.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Urgh.  There's not really anything wrong with this patch of itself,
> but it really underlines my feeling that the whole yaml output thing
> is a bunch of hacks in pursuit of a bogus goal.

Validating DTs is a bogus goal?

> Yaml output wants to include information that simply isn't present in
> the flattened tree format (without considering bindings), so it relies
> on formatting conventions in the dts, hence this test in the first
> place.  This alleges it removes a restriction, but it only works if a
> bunch of extra heuristics are able to guess the types correctly.

The goal here is to validate dtb files which I'd think you'd be in
favor of given your above opinions. For that to work, we have to
transform the data into the right types somewhere. We don't need any
heuristics for that. For the most part, it is done using the
definitive type information from the schemas themselves to format the
data. The exception is #*-cells patterns which need to parse the tree
to construct the type information. Given dtc already has all that
knowledge in checks, it's easier to do it there rather than
reimplement the same parsing in python.

Rob
