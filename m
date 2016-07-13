From: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: Re: [PATCH] fdtget.c: Fix memory leak
Date: Wed, 13 Jul 2016 08:05:16 +0200
Message-ID: <5785DA1C.7030601@tribudubois.net>
References: <1468362968-32090-1-git-send-email-jcd@tribudubois.net>
 <20160713025005.GD14615@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160713025005.GD14615-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org

Le 13/07/2016 04:50, David Gibson a =E9crit :
> On Wed, Jul 13, 2016 at 12:36:08AM +0200, Jean-Christophe Dubois wrot=
e:
>> CID 132823 (#1 of 1): Resource leak (RESOURCE_LEAK)
>> 5. leaked_storage: Variable blob going out of scope leaks the storag=
e it points to.
>>
>> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> Since the program exits immediately after this free(), there's really
> no point.
This is usually a good practice to free explicitly the memory we are=20
allocating rather than relying on some kind of (final) garbage collecto=
r=20
(like in java).

It seems cheap to fix but this is your call.
>
>> ---
>>   fdtget.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/fdtget.c b/fdtget.c
>> index 4377419..fb9d0e1 100644
>> --- a/fdtget.c
>> +++ b/fdtget.c
>> @@ -266,14 +266,20 @@ static int do_fdtget(struct display_info *disp=
, const char *filename,
>>   				continue;
>>   			} else {
>>   				report_error(arg[i], node);
>> +				free(blob);
>>   				return -1;
>>   			}
>>   		}
>>   		prop =3D args_per_step =3D=3D 1 ? NULL : arg[i + 1];
>>  =20
>> -		if (show_data_for_item(blob, disp, node, prop))
>> +		if (show_data_for_item(blob, disp, node, prop)) {
>> +			free(blob);
>>   			return -1;
>> +		}
>>   	}
>> +
>> +	free(blob);
>> +
>>   	return 0;
>>   }
>>  =20
