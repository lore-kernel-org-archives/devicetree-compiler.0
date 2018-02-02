From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] dtdiff: change to POSIX shell
Date: Thu, 1 Feb 2018 22:35:26 -0600
Message-ID: <CACNAnaESOk5Wb+Y1Sy2X3AuCqXFMj1QZ6_CFORTE=AcFRckM4A@mail.gmail.com>
References: <20180110054756.23464-1-vapier@gentoo.org> <20180110055718.GG19773@umbus.fritz.box>
 <20180202041418.GD27582@vapier>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180202041418.GD27582@vapier>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Feb 1, 2018 at 10:14 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 10 Jan 2018 16:57, David Gibson wrote:
>> On Wed, Jan 10, 2018 at 12:47:56AM -0500, Mike Frysinger wrote:
>> > This changes from the bash-specific process substitution feature to
>> > reading with pipes.  It relies on /dev/fd or /proc/self/fd existing.
>> >
>> > URL: https://crbug.com/756559
>> > Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Yeah, sorry, replacing a dependency on a complex but widely available
>> shell with a much more cryptic dependency on a Linux specific feature
>> does not seem like a win to me.
>
> bash's <(...) only works when the host supports either /dev/fd or /proc/self/fd,
> so i don't think this is less portable.  /dev/fd also isn't Linux-specific.
> -mike

For what it's worth, this isn't completely true. Bash can also use
FIFOs for process substitution [1]. FreeBSD does not use fdescfs by
default, but it can be mounted, and using fdescfs for process
substitution is provided as an optional feature in shells/bash. It
would be nice to not grow a dependency on fdescfs for dtc. =)

[1] https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
