From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] libfdt: add helpers to read address and size from reg
Date: Mon, 6 Feb 2017 07:32:57 -0800
Message-ID: <CAPnjgZ1wWFY1YNMZdKFmbO3LM-wNPxKq4Xf3S6tAJD9L3z6UQw@mail.gmail.com>
References: <1480979490-3745-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=23O1I3doJCrbMK8kz9hxdtV9KOZnE9ByVeS/wUldT+k=;
        b=dy+YU9FiYEQ6xctgpEVTo5vPwI4nqUA/ZSql0gyqt9iGFTEhD1dZbCztcFfUEDR5LK
         ZFngnNb1jytohsYS9TwHA7QuqbGi21YfjW8sald2jClHlPN8xSOwnPJJW857wezvoLS7
         sFmCFGqSweAu0fl9YpxPDLa95iLpHah9ILzzdnGSbApk7Jo+tUHYsJ31qDxGKUPgnXAi
         +UymcJIiDHVSgd02KCiLU17riihaMvxIIeHuyPdlZGfQpxP/H9RWd4efweH4W1A+HF4J
         sd2sjdMsdea4v4OsNlOIgNIzq0ani/aS2R+HHsuNjRyjRSVj2KK6ywya9WmcJwalfzOr
         P8VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=23O1I3doJCrbMK8kz9hxdtV9KOZnE9ByVeS/wUldT+k=;
        b=YtfYXcZYRAMOePMWEeBaV29VOM2H0gH78+tX5K859Dcr1YzsQ8XBT8QXtxDbx55Yma
         upFmWYYNNC+6mVBcf0bM+98tjtrYp7b0r8O77hAzXo8TWEqS/A0rEd/lqN7IBA+HlCp7
         zM4SOz/5bavJDxoTU/BB/0k5ta2Yavx7+B2W8=
In-Reply-To: <1480979490-3745-1-git-send-email-b-fair-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 5 December 2016 at 15:11, Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org> wrote:
> This patch extends the capability of libfdt to parse the contents of device
> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>
> It adds helper functions which read the address and size of a device from
> the reg property and performs basic sanity checks. Some functions also
> parse the values into integers in the host endianness.
>
> The functions do not perform translation to a physical address using the
> ranges properties of parents, but this enhancement may be added as a
> separate function in the future.
>
> Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> ---
>
> Changes since v1:
>
>   * Split functions into smaller pieces
>     -> Also added wrapper functions to perform the full set of actions
>   * Changed types of addresses and sizes to uint64_t
>   * Removed unneeded constants
>   * Renamed and exported fdt_read_integer()
>
>  libfdt/fdt_addresses.c | 118 ++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 145 +++++++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/version.lds     |   5 ++
>  tests/.gitignore       |   1 +
>  tests/Makefile.tests   |   2 +-
>  tests/addr_size.c      | 130 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/addresses.dts    |  11 ++++
>  tests/run_tests.sh     |   1 +
>  8 files changed, 412 insertions(+), 1 deletion(-)
>  create mode 100644 tests/addr_size.c

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

One point to note is that fdt_parent_offset() can be quite slow. It
might be worth mentioning that in the function comments.

Regards,
Simon
