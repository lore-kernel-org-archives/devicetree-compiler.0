From: Jean-Christophe DUBOIS <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: Re: [PATCH] DTC: Fix unprotected file name member access.
Date: Mon, 11 Jul 2016 08:22:06 +0200
Message-ID: <57833B0E.8040508@tribudubois.net>
References: <1468189028-1641-1-git-send-email-jcd@tribudubois.net>
 <20160711013053.GC16355@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711013053.GC16355-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

Hello David,

Le 11/07/2016 03:30, David Gibson a =E9crit :
> On Mon, Jul 11, 2016 at 12:17:08AM +0200, Jean-Christophe Dubois wrot=
e:
>> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> A patch like this really needs a commit message describing when the
> situation it's guarding against can occur.  In this case when can
> pos->file be non-NULL, but pos->file->name =3D=3D NULL.
I stumbled on these issues while running some code checkers on previous=
=20
versions of the DTC compiler.

In general it's seems like a good idea for a function to protect itself=
=20
against bad use. I have not looked at  the DTC source tree to check if=20
such bad use could happen at present (and I don't know about future) bu=
t=20
I do feel safer with these kinds of checks in place.
>
> It's not exactly high priority, since srcpos_dump() has no current
> users AFAICT.
srcpos_dump() doesn't seem to be used for now but the forced cast of th=
e=20
"file" member as a (char *) is a bit disturbing in the source code. The=
=20
first user might be surprised of the output.

srcpos_string() seems to be used mainly in error case (srcpos_verror,=20
srcpos_error, ...) which might be considered as unimportant (?) but=20
still, I feel safer with the check (a more meaningful output?).

Now it is certainly not high priority (everything is working OK in the=20
normal case) but it is cheap to fix.

Regards

JC

>
>> ---
>>   srcpos.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/srcpos.c b/srcpos.c
>> index af7fb3c..927ac54 100644
>> --- a/srcpos.c
>> +++ b/srcpos.c
>> @@ -252,7 +252,7 @@ void
>>   srcpos_dump(struct srcpos *pos)
>>   {
>>   	printf("file        : \"%s\"\n",
>> -	       pos->file ? (char *) pos->file : "<no file>");
>> +	       (pos->file && pos->file->name) ? pos->file->name : "<no fil=
e>");
>>   	printf("first_line  : %d\n", pos->first_line);
>>   	printf("first_column: %d\n", pos->first_column);
>>   	printf("last_line   : %d\n", pos->last_line);
>> @@ -267,7 +267,7 @@ srcpos_string(struct srcpos *pos)
>>   	const char *fname =3D "<no-file>";
>>   	char *pos_str;
>>  =20
>> -	if (pos)
>> +	if (pos->file && pos->file->name)
>>   		fname =3D pos->file->name;
>>  =20
>>  =20
