From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Tue, 21 Jan 2020 08:37:34 -0700
Message-ID: <52f4b34454ab41151113c4ba5e4011d8b992e21f.camel@freebsd.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
         <20200113181625.3130-2-alexandre.torgue@st.com>
         <20200116005741.GB54439@umbus>
         <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
         <20200117090937.GU54439@umbus>
         <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
         <20200119063916.GD54439@umbus>
         <9c4e873ef998a5800a4cac673b7e925fc90e3293.camel@freebsd.org>
         <20200121020525.GL54439@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:content-type:references:in-reply-to:
         date:cc:to:from:subject:message-id:from;
        bh=D94FXnazRtqlqb+RPa3XqsemmmgJF2R6JtQgf5Gwj8I=;
        b=hE9ggVaGkvFL9p7YbegSpHWtKw8shesLj4ZOn/mp4pymj9YX3IFd8xPYx5fnwm8TKAL/9evfPyiq7
         pSNXm+n0ZPdFxsWdXjnIJz+tXx5Tr9aoBiaao0km5hOS7VCF6jzxRwnjFgQmhNpzKjU3WltV8w8gGY
         n2IwGawtWJO0nPSI/f5K1UP9MqiWJSo1z2e/vBzg7CCRORPwarHL/cxNM0KQIqpmbx2Vbl5uRE5uLV
         86hQdI5K46yEGQLNqhttppmu21C1bOywnVqzCjD4QxntS4OvhpIDOR/eBOX+ah5URUr3cDFtZEOLoR
         R2TSe4sJ43hNGH47BwOqBroSnFGyncA==
In-Reply-To: <20200121020525.GL54439@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, 2020-01-21 at 13:05 +1100, David Gibson wrote:
> > Given that dts files are run through the C preprocessor before being
> > fed to dtc, the build script could use the '-include' flag to force-
> > include a fragment containing generated build info without any need to
> > modify existing dts files.
> 
> Uh... maybe.  -include will essentially prepend the forced file, which
> is a bit awkward for our purposes.  It means that the prepended file
> would need the /dts-v1/ tag, and we couldn't have it in the main files
> which would be a bit confusing.  I think it would also cause problems
> with any /memreserve/ tags and means that the main tree could in
> theory overwrite the build information which we don't necessarily
> want.

Oh.  I thought I had seen a proposal or patch fly by here recently that
allowed multiple /dts-v1/ tags without any warnings, specifically to
wish away any problems with what order things might get included.  If
that was just some kind of fever-dream, then I guess: nevermind. :)

-- Ian

