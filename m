From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] fdtput: add delete node and property function
Date: Wed, 14 Jan 2015 06:47:20 -0800
Message-ID: <CAPnjgZ26SA5=-xLjT3OU04Xfe-AuUo2-s0+rnioPnK8vJKxeFg@mail.gmail.com>
References: <1421207637-32690-1-git-send-email-long.wanglong@huawei.com>
	<CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA@mail.gmail.com>
	<54B5FDCC.3050905@huawei.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=uY8u6kp6+CC51nPaWdtHNDB0oHaII7tpyciAMDSxA/U=;
        b=UIxrDLk1kIfyKIZz3zfyr6ADcrGuOO2vlU0TpOg80gOaHZ9sqLOErmWnAMqAk8BlnX
         RPIOybi15KnqurI2EVwn8Zf6sMIpnmLRWWUU06AXDVT9iEf/a8E+FW8CtlNFr/9SrWcG
         6ESk9KA5zPYbC2XuUbhZUYSWkkGfhBstcsh23i+JajH8MNbsspVDUeAfqim8nhAOZ5nC
         2FcKL1P2YohcIsqpPSMivf2StFTVKjL/biYEFZ/TXhm+z52envCHOrNHYvRe2ZokFyb7
         Mq62jyAoM3Xf+eNOrG5SdpdJeQ8+w4lcGY3uF/aJcfBdCzj7Mnb7eBzfPjejqfSK4TCf
         TWoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=uY8u6kp6+CC51nPaWdtHNDB0oHaII7tpyciAMDSxA/U=;
        b=c9maQ0QX8cnDw3vmXF/Dp80Ab3UyUPNxEr2r76qI/b68Lovxu60LSlJtaVBx6eV+sl
         JfxXsxUYjXsD2w2pOFhncGojSQyGFkki8EuG4k2IzieHXWwRJJh53BqUvgNdIt1pUr7z
         RiLWFTmkScjoCxcRVG0qFoRESC2+fem+NQ+6U=
In-Reply-To: <54B5FDCC.3050905-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Wang,

On 13 January 2015 at 21:25, long.wanglong <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> On 2015/1/14 12:07, Simon Glass wrote:
>> Hi Wang,
>>
>> On 13 January 2015 at 19:53, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>>> add the delete node and property function for fdtput.
>>>
>>> usage:
>>> 1) delete a node
>>>  # fdtput test.dtb -d node /chosen/son
>>> 2) delete a property
>>>  # fdtput test.dtb -d prop /chosen/ prop_name
>>
>> This is a great addition!
>>
>> I know David is keen on single character flags. But would it be better
>> to have a separate delete option, e.g.
>>
>> -r to remove a node
>> -d to delete a property
>>
> ok
>
> i will use single character flags in next version of the patch.

You might want to wait to see if David has some comments before
sending the next version.

>
>>>
>>> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  fdtput.c           | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>>  tests/run_tests.sh | 17 ++++++++++
>>>  2 files changed, 108 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/fdtput.c b/fdtput.c
>>> index 2a8d674..28e1f55 100644
>>> --- a/fdtput.c
>>> +++ b/fdtput.c
>>> @@ -32,6 +32,8 @@
>>>  enum oper_type {
>>>         OPER_WRITE_PROP,                /* Write a property in a node */
>>>         OPER_CREATE_NODE,               /* Create a new node */
>>> +       OPER_DELETE_NODE,               /* Delete a node */
>>> +       OPER_DELETE_PROP,               /* Delete a property in a node */
>>>  };
>>>
>>>  struct display_info {
>>> @@ -270,6 +272,60 @@ static int create_node(char **blob, const char *node_name)
>>>         return 0;
>>>  }
>>>
>>> +/**
>>> + * Delete a property of a node in the fdt.
>>> + *
>>> + * @param blob         FDT blob to write into
>>> + * @param node_name    Name of node which the delete property belongs to
>>> + * @param prop_name    Name of property to delete
>>> + * @return 0 on success, or -1 on failure
>>> + */
>>> +static int delete_prop(char **blob, const char *node_name, const char *prop_name)
>>
>> Can you just pass char *blob? Why the double pointer? Same with the
>> next function.
>>
> hi,Simon
>
> the function create_paths and create_node use the double pointer.
>
>  static int create_paths(char **blob, const char *in_path)
>  static int create_node(char **blob, const char *node_name)
>
> In order to maintain a consistent coding style, i use char **blob instead of char *blob.
> should we update char **blob  to char *blob in all functions?

When expanding the tree (e.g. by adding nodes or properties) we might
need to relocate it. But since you are deleting things, that isn't
necessary.

Regards
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
