From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Mon, 20 Jan 2020 11:55:52 -0700
Message-ID: <9c4e873ef998a5800a4cac673b7e925fc90e3293.camel@freebsd.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
         <20200113181625.3130-2-alexandre.torgue@st.com>
         <20200116005741.GB54439@umbus>
         <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
         <20200117090937.GU54439@umbus>
         <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
         <20200119063916.GD54439@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:content-type:references:in-reply-to:
         date:cc:to:from:subject:message-id:from;
        bh=XQaGOWp68ynXiQTR7ZytPbCeiO5SidXI89cIwpirc/0=;
        b=MVx8hVUAuMrFPK/lp99uTKmjtW3fEGVcwpPNmILNo6xiox4CmQPYBHjB8/4jBOLtSXIOvcv27NR+C
         WzUvoTuflk3cqw/gIz6vh/py+3lnBnZzQj1l4sjKWhFHKJtB6z3sdvE785pTK5VYE7QdwdQ1ShODRA
         13bYtHdmswBxu582CK1HpOLg+QlvrXy1h1MzeQNqn45z7Ov+thq+DvVatp0dv9HfgJsyJOfqUGMuzt
         48ppsCui+bILTVUq1IravA7WjZHeFss/0SAw/KoUXMkmXcn67giZ7vTW3yokYNwY3L20sTfH1Bm+Bg
         G7PteEfURcR19NonfgV0YlYdEFEupcQ==
In-Reply-To: <20200119063916.GD54439@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sun, 2020-01-19 at 16:39 +1000, David Gibson wrote:
> On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
> > On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > 
> > > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > > Hi David
> > > > 
> > > > [...]
> > > > 
> > > > My first idea was to not modify all existing .dts files. Adding
> > > > an extra option in dtc is (for me) the softer way to do it. I
> > > > mean, compile information should come through compiler without
> > > > modify .dts files outside from dtc. In this way it will be easy
> > > > to everybody using dtc (inside our outside Linux tree) to add
> > > > dtb build info (even if they don't how to write a dts file).
> > > 
> > > But you're not really having this information coming from the
> > > compiler.  Instead you're adding a compiler option that just
> > > force includes another file into the generated tree, and it's up
> > > to your build scripts to put something useful into that file.
> > > 
> > > I don't really see that as preferable to modifying the .dts
> > > files.
> > > 
> > > I also dislike the fact that the option as proposed is much more
> > > general than the name suggests, but also very similar too, but
> > > much more specific than the existing /incbin/ option.
> > > 
> > > What might be better would be to have a dtc option which force
> > > appends an extra .dts to the mail .dts compiled.  You can then
> > > put an overlay template in that file, something like:
> > > 
> > > &{/} {
> > >         linux,build-info = /incbin/ "build-info.txt;
> > > }
> > 
> > I like this suggestion either as an include another dts file or an
> > overlay.
> 
> Sorry, to be clear what I'm talking about here is just including
> another dts file, and using the compile-type overlay syntax.  This is
> not the same as .dtbo style runtime overlays (though the final result
> is about the same in this case).
> 

Given that dts files are run through the C preprocessor before being
fed to dtc, the build script could use the '-include' flag to force-
include a fragment containing generated build info without any need to
modify existing dts files.

> > The latter could be useful as a way to maintain current dtb
> > files while splitting the source files into base and overlay dts
> > files.
> > 
> > But no, let's not prepend this with 'linux'. It's not a property
> > specific for Linux to consume.
> 
> It's not really about who consumes it.  It's about defining a
> namespace for the new property to exist in, since it's not part of a
> relevant standard (if we wanted to make it such, we should pin down
> what goes in there with much more precision).
> 
> This is specific to files built in the Linux tree, hence my
> suggestion of "linux", whoever ends up consuming them.
> 

I tend to agree with this.  We use the dts files in freebsd, and if we
wanted to include some build metadata, it would probably have different
info in a different format than what linux uses.  I would be inclined
to add those as freebsd,build-info.  As well as the namespace, this
would give consumers some clue about what format the build info string
might have.

-- Ian


