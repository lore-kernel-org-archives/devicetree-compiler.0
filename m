From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 07/26] libfdt: Add a function to write a property placeholder
Date: Fri, 29 Jan 2016 11:23:31 -0700
Message-ID: <CAPnjgZ3jOaYuZOeafhnH0dq52uRa8iXjq=kC_8qtnB7Knq9GCA@mail.gmail.com>
References: <1453999186-18747-1-git-send-email-sjg@chromium.org>
 <1453999186-18747-8-git-send-email-sjg@chromium.org> <20160129052917.GM23043@voom.redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=FU4oQ7W01RQ6kiNA4lf8qT49+oaS0JSPSVNeXW1iMcM=;
        b=fVSSS2eT7K1cibczZ2KeCy7Zs04CKl23GB+SaFeNvvU5p61u2aEug9JtVSl+/4vhTQ
         bXhIkwXLVq5b0JPUiQ/G3IdsWp9LaaSPvSELiYM5mu3owMlemtmN8p7JorCB7jGfJElI
         6+CKptmu7VO+pgq+2k2un4WW2VWCEdfStBPOlSWEpjwLce3NmaOZsTvl7eg9fqzY1g33
         t64GQ2gNrmrcnX2UZZx13KGwbP2ENzIRScUhvn2aPgKdju0USrhnx3TcpIO19PaMT45N
         MhCB9+3Hz8hNGokyk7i7TpHJZGJqVQNVLigi64EXE27s6kqNim25EpFB9eUMP6GEZxzD
         sOeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=FU4oQ7W01RQ6kiNA4lf8qT49+oaS0JSPSVNeXW1iMcM=;
        b=AF7usUU61/T33z/2dnleqitLxWEByORp46BMU4T+bSOP1SQkXOS24sl3yTji1c7bsK
         i4hEHbVMKNrZLgw/VgsASvL9Gc0+gKDDK+3L0Tevv7kYJqbi07tiw8NzDuOUApawhr0X
         JGsps48GgMtbUd9KE5ZrPqg5e/Hn3LUUSv+gQ=
In-Reply-To: <20160129052917.GM23043-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On 28 January 2016 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jan 28, 2016 at 09:39:27AM -0700, Simon Glass wrote:
>> The existing function to add a new property to a tree being built requires
>> that the entire contents of the new property be passed in. For some
>> applications it is more convenient to be able to add the property contents
>> later, perhaps by reading from a file. This avoids double-buffering of the
>> contents.
>>
>> Add a new function to support this and adust the existing fdt_property() to
>> use it.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> So, obviously such a patch should really go towards upstream libfdt.
>
> I'm happy enough with the concept, but I don't like the name.
>
> I'd prefer fdt_property_reserve() - the idea being that it reserves
> space for the property but doesn't fill it in.

Sounds good. I'll work up a patch. I tend to sync with upstream one a
quarter or so.

>
>> ---
>>
>>  include/libfdt.h    | 16 ++++++++++++++++
>>  lib/libfdt/fdt_sw.c | 16 ++++++++++++++--
>>  2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/libfdt.h b/include/libfdt.h
>> index e48c21a..c3f37ee 100644
>> --- a/include/libfdt.h
>> +++ b/include/libfdt.h
>> @@ -1181,6 +1181,22 @@ static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
>>  {
>>       return fdt_property_u32(fdt, name, val);
>>  }
>> +
>> +/**
>> + * fdt_property_val - add a new property and return a pointer to its value
>> + *
>> + * @fdt: pointer to the device tree blob
>> + * @name: name of property to add
>> + * @len: length of property value in bytes
>> + * @valp: returns a pointer to where where the value should be placed
>> + *
>> + * returns:
>> + *   0, on success
>> + *   -FDT_ERR_BADMAGIC,
>> + *   -FDT_ERR_NOSPACE, standard meanings
>> + */
>> +int fdt_property_val(void *fdt, const char *name, int len, void **valp);
>> +
>>  #define fdt_property_string(fdt, name, str) \
>>       fdt_property(fdt, name, str, strlen(str)+1)
>>  int fdt_end_node(void *fdt);
>> diff --git a/lib/libfdt/fdt_sw.c b/lib/libfdt/fdt_sw.c
>> index 320a914..9c1df3d 100644
>> --- a/lib/libfdt/fdt_sw.c
>> +++ b/lib/libfdt/fdt_sw.c
>> @@ -175,7 +175,7 @@ static int _fdt_find_add_string(void *fdt, const char *s)
>>       return offset;
>>  }
>>
>> -int fdt_property(void *fdt, const char *name, const void *val, int len)
>> +int fdt_property_val(void *fdt, const char *name, int len, void **valp)
>>  {
>>       struct fdt_property *prop;
>>       int nameoff;
>> @@ -193,7 +193,19 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
>>       prop->tag = cpu_to_fdt32(FDT_PROP);
>>       prop->nameoff = cpu_to_fdt32(nameoff);
>>       prop->len = cpu_to_fdt32(len);
>> -     memcpy(prop->data, val, len);
>> +     *valp = prop->data;
>> +     return 0;
>> +}
>> +
>> +int fdt_property(void *fdt, const char *name, const void *val, int len)
>> +{
>> +     void *ptr;
>> +     int ret;
>> +
>> +     ret = fdt_property_val(fdt, name, len, &ptr);
>> +     if (ret)
>> +             return ret;
>> +     memcpy(ptr, val, len);
>>       return 0;
>>  }
>>

Regards,
Simon
