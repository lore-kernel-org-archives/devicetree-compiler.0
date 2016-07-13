From: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: Re: [PATCH] convert-dtsv0-lexer.l: fix memory leak
Date: Wed, 13 Jul 2016 08:02:27 +0200
Message-ID: <5785D973.7090108@tribudubois.net>
References: <1468362950-32027-1-git-send-email-jcd@tribudubois.net>
 <20160713020446.GC14615@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160713020446.GC14615-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org

Le 13/07/2016 04:04, David Gibson a =E9crit :
> On Wed, Jul 13, 2016 at 12:35:50AM +0200, Jean-Christophe Dubois wrot=
e:
>> CID 132822 (#1 of 1): Resource leak (RESOURCE_LEAK)
>> 9. leaked_storage: Variable newname going out of scope leaks the sto=
rage it points to
>>
>> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
>> ---
>>   convert-dtsv0-lexer.l | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
>> index 259e527..8d8289b 100644
>> --- a/convert-dtsv0-lexer.l
>> +++ b/convert-dtsv0-lexer.l
>> @@ -208,6 +208,12 @@ static void convert_file(const char *fname)
>>   	char *newname;
>>  =20
>>   	newname =3D xmalloc(len + sizeof(suffix));
>> +
>> +	if (!newname) {
>> +		die("failed to allocate memory for input file %s: %s\n",
>> +		    fname, strerror(errno));
>> +	}
>> +
> This hunk is unnecessary.  xmalloc() already die()s rather than faili=
ng.
OK.

On a correctness point of view there is still the "free" to be done (se=
e=20
below).
>
>>   	memcpy(newname, fname, len);
>>   	memcpy(newname + len, suffix, sizeof(suffix));
>>  =20
>> @@ -223,6 +229,8 @@ static void convert_file(const char *fname)
>>  =20
>>   	while(yylex())
>>   		;
>> +
>> +	free(newname);
>>   }
>>  =20
>>   int main(int argc, char *argv[])
