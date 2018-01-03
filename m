From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Tue, 2 Jan 2018 20:37:16 -0600
Message-ID: <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
References: <20180101041518.23806-1-kevans@FreeBSD.org> <20180103001300.GF24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103001300.GF24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 2, 2018 at 6:13 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Dec 31, 2017 at 10:15:18PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
>> This doesn't make things work out of the box necessarily, but it gets us a step
>> closer.
>>
>>  - alloca(3) on FreeBSD and OpenBSD, at least, is provided as part of
>> <stdlib.h>. I make the change here for FreeBSD only, though, as I cannot test it
>> on OpenBSD.
>
> TBH, rather than dicking around with #ifdefs and headers, I'd rather
> use use malloc() instead of alloca().

Alrighty- I'll prepare a patch for this, knowing that's a direction
you're comfortable heading in.

>>  - stat -c %s's equivalent on FreeBSD is stat -f %Uz; these differ enough, allow
>> STATSZ in the environment to specify local replacement for a stat that outputs
>> size in bytes of an argument.
>
> Can you split this change out into a separate patch, please.

Will do.
