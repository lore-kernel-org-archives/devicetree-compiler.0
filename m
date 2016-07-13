From: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: Re: [PATCH] fdtput.c: Fix memory leak.
Date: Wed, 13 Jul 2016 08:06:19 +0200
Message-ID: <5785DA5B.6030604@tribudubois.net>
References: <1468362981-32142-1-git-send-email-jcd@tribudubois.net>
 <20160713025022.GE14615@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160713025022.GE14615-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org

Le 13/07/2016 04:50, David Gibson a =E9crit :
> On Wed, Jul 13, 2016 at 12:36:21AM +0200, Jean-Christophe Dubois wrot=
e:
>> CID 132821 (#1 of 1): Resource leak (RESOURCE_LEAK)
>> 12. leaked_storage: Variable value going out of scope leaks the stor=
age it points to.
>>
>> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> As with fdtput, because the program exits immediately after, there's
> really no point to this free().
As we are already freeing "blob" and on a correctness point of view (an=
d=20
to be consistent) we should also free "value".


>
>> ---
>>   fdtput.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/fdtput.c b/fdtput.c
>> index 9b15c53..db65e96 100644
>> --- a/fdtput.c
>> +++ b/fdtput.c
>> @@ -328,7 +328,7 @@ static int delete_node(char *blob, const char *n=
ode_name)
>>   static int do_fdtput(struct display_info *disp, const char *filena=
me,
>>   		    char **arg, int arg_count)
>>   {
>> -	char *value;
>> +	char *value =3D NULL;
>>   	char *blob;
>>   	char *node;
>>   	int len, ret =3D 0;
>> @@ -374,6 +374,11 @@ static int do_fdtput(struct display_info *disp,=
 const char *filename,
>>   	}
>>  =20
>>   	free(blob);
>> +
>> +	if (value) {
>> +		free(value);
>> +	}
>> +
>>   	return ret;
>>   }
>>  =20
