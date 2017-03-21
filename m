From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v11 0/5] Introduce Python bindings for libfdt
Date: Tue, 21 Mar 2017 10:02:00 -0600
Message-ID: <CAPnjgZ0WkRXRqQBx0W6QhMqROZtC=RTebdA0TBrEPidtxRV17A@mail.gmail.com>
References: <20170317221434.15390-1-sjg@chromium.org> <20170321053531.GA19078@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=6U0LBqvPiinVGTD9F+HnSSmJ+0crEvrae44syzdlTSU=;
        b=M+D2biJTbpkLWrcnhdWkp8dK9MY3U2SqYh96mqQhxOP8sYwj5QGWMjco2xrkQIPOyz
         FJbWyBbp9muqGOcl6uKW6YGHGHwN5sD8H1UtflXbFyy8G/dKR5P39ZuEy1+oHO9ulD+Q
         3amyXYT4d1GGwItDWkjAhojI+uH4ihCV5JUOR5YZpHxrJo9fOJ6IIjA2vPwUJqeDpIgg
         EmF7GAm7zbTvfOS2lw8ehO8T9Zp2JP+E9PeKSwHQNL/YFURYwwE+Og+CwpBBwbZVYBqu
         41GLZ1IwXjJJjggEExqXsZb1L4mORVyQRUdRerFzEQ90nvla8uyS400ninM85V20kaq2
         spoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=6U0LBqvPiinVGTD9F+HnSSmJ+0crEvrae44syzdlTSU=;
        b=dsnWUryLUcS/K31QY8nlDJajRI88djSGwHDq/eIQpdDOm9p4UH2KGMeY2Q0v5HP7Ad
         JJdzmu52Mn/iQBW9xfrfxmzKsAhhTvnJ5ozmtINguUqImBV0BnHITozAItEtCT/F1qH5
         6y2oxjX5EWp4I/AlUNF+Pbi3uVXYDuz564WLQ=
In-Reply-To: <20170321053531.GA19078-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 20 March 2017 at 23:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Mar 17, 2017 at 04:14:29PM -0600, Simon Glass wrote:
>> At present libfdt consists of only a C implementation. Many scripts are
>> written using Python so it useful to have Python bindings for libfdt.
>> Apparently this has never been attempted before, or if so I cannot find a
>> reference.
>>
>> This series starts the process of adding this support, with just a
>> bare-bones set of methods.
>>
>> The v11 series provides binding that can be used like this:
>>
>>     fdt = libfdt.Fdt(open(fname).read())
>>     node = fdt.path_offset('/subnode@1')
>>     print fdt.get_prop(node, 'compatible')
>>     subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
>>     while subnode > 0:
>>         print fdt.get_name(subnode)
>>         subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])
>>
>> This version includes a simple class for properties.
>
> Applied to master.  I made a small change in the last patch, so that
> the error message when the python packages aren't installed is less
> scary looking.

Yes that is better, but note the 'pylibgfdt' typo.

I suppose it is too soon for a new release tag?

I'm also interested in your thoughts on where to take this next.
Presumably we should support the rest of the functions in libfdt.

Benjamin, any plans?

Regards,
Simon
