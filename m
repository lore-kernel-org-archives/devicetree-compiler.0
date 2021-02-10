From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Error on node-name and property name being the
 same
Date: Tue, 9 Feb 2021 19:33:05 -0600
Message-ID: <035E7DE0-A9AC-4738-81CD-034784754B07@linaro.org>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
 <20210210000827.GB4450@yekko.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=VHyTN/IYY9nPxjQw0V7shHWsqdqlzJgasceXfU2g+vg=;
        b=TDNRqr6mu2KPna8fowkVMzYZySjjy0kOxWBm7pRsOb3/IcQ/Ypo1qqET1HvYl+XWBj
         gj+E6qWVBOp9xmLcOnIuk4w636Cq5XLZyMz/A4xSO1FjkoSn4rPYDr9xlYFQqVPpQi9W
         +EY83VoZiIjsFATPXLh+1wzN/aG658n4CZlySmSBd5KlRMjAz2WFTEu8C9n2CvKNcS02
         N62nYQM6M4DEgun7RRlsJhIhzQrhcDS/GNek/M81WmW+wanr1lSA1p8R/O3ar/EFdoP2
         C7feaJVzxUhkwN1PaxghB+2mbYVMbVM7O575EfSofZ0F94mhSBQQPftoXX8GU5BNPsfe
         RvBg==
In-Reply-To: <20210210000827.GB4450-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org



> On Feb 9, 2021, at 6:08 PM, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Tue, Feb 09, 2021 at 11:50:59AM -0600, Kumar Gala wrote:
>> Treat a node-name and property name at the same level of tree as
>> an error.
>>=20
>> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Nack.  Discouraging/banning this at the spec level for future trees is
> reasonable.  But dtc should be able to handle old trees that *do* have
> node/property conflicts as well.

Then we can make this a warning instead of an error.  Or a user is =
always about to disable this via the =E2=80=99no-=E2=80=A6=E2=80=99 =
command line option.

- k

>=20
>> ---
>> checks.c | 18 +++++++++++++++++-
>> 1 file changed, 17 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/checks.c b/checks.c
>> index 17cb689..3f46043 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -330,6 +330,22 @@ static void check_node_name_format(struct check =
*c, struct dt_info *dti,
>> }
>> ERROR(node_name_format, check_node_name_format, NULL, =
&node_name_chars);
>>=20
>> +static void check_node_name_vs_property_name(struct check *c,
>> +					     struct dt_info *dti,
>> +					     struct node *node)
>> +{
>> +	struct property *prop;
>> +
>> +	if (node->parent) {
>> +		for_each_property(node->parent, prop) {
>> +			if (strcmp(node->name, prop->name) =3D=3D 0)
>> +				FAIL(c, dti, node, "node name and =
property name conflict");
>> +		}
>> +	}
>> +}
>> +ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
>> +      NULL, &node_name_chars);
>> +
>> static void check_unit_address_vs_reg(struct check *c, struct dt_info =
*dti,
>> 				      struct node *node)
>> {
>> @@ -1796,7 +1812,7 @@ WARNING(graph_endpoint, check_graph_endpoint, =
NULL, &graph_nodes);
>> static struct check *check_table[] =3D {
>> 	&duplicate_node_names, &duplicate_property_names,
>> 	&node_name_chars, &node_name_format, &property_name_chars,
>> -	&name_is_string, &name_properties,
>> +	&name_is_string, &name_properties, &node_name_vs_property_name,
>>=20
>> 	&duplicate_label,
>>=20
>=20
> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

