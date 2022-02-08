From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Tue, 8 Feb 2022 14:43:44 -0700
Message-ID: <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
References: <20211107224346.3181320-1-sjg@chromium.org> <YgCblAa5Hxw33OXV@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuuoNAfT1uZIuzOYzaINHGAasN/yTu5iX77E0WTbgj4=;
        b=AJjnzRs4FuNwg4NioO67sbgfdIDFDb8v9YjPG1mjBhp50mQtYAyk4iOvjQBY0n9gwC
         ipiCo7iUM6i8oMljvATW0og65O+Cj52R/lKaCt8cDl4SJPKpo2wwi1864ysI84U9Oufd
         m8Ebuut5LQf5s0nV2GG0lYrqudSKEkr0rT82Q=
In-Reply-To: <YgCblAa5Hxw33OXV@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Sun, 6 Feb 2022 at 21:10, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> > Note: This was last sent 6 years ago. It really belongs upstream and I
> > believe it is useful functionality for libfdt, so I am trying again.
> > Please take a fresh look at this. It is cut back from the previous series.
> > If accepted we can expand the feature set piece by piece from here.
>
> Sorry it's taken me so long to look at this.  Again.  I can't dispute
> that it's useful for certain use cases.  But as for belonging
> upstream...
>
> This series adds quite a lot of conceptual complexity.  It introduces
> a new data structure, new state structures, a entirely new mode of
> working with a tree and a bunch of configuration parameter types on
> top of the new entry points and new tool.  I still find the semantics
> of the different criteria for inclusion/exclusion from a region pretty
> bewildering.

It is sufficient to achieve its purpose, but I don't think it is any
more complex than that.

>
> That makes me pretty disinclined to add this to the scope of
> maintenance for libfdt.  As you've probably noticed, I'm already
> struggling to keep on top of maintenance for the existing libfdt
> interfaces.  AFAICT everything here can be implemented fairly
> naturally in terms of libfdt's existing public interface. so I'm not
> really seeing a compelling reason for this to be merged into libfdt,
> rather than being its own separate library that depends on libfdt.

Are you suggesting:

1. that libfdt should move to a new maintainer
2. that you would accept these patches if someone else maintained them
within the libfdt tree
3. that we set up a separate tree to fork libfdt, with these changes in
4. that we put these changes in a separate tree?

Regards,
Simon
