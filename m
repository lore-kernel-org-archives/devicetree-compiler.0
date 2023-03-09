From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] checks: Suppress warnings on overlay fragments
Date: Thu, 9 Mar 2023 09:12:41 -0600
Message-ID: <CAL_JsqKTM=gaQGZhrBCRkBusYYMci0mJGAFf9RTvCx00G2OJzg@mail.gmail.com>
References: <20230308091539.11178-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678374779;
        bh=Ek6/MrpM30zXBprAULQKBEhZve6Gui+5nCKr4vV+Zhw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rxqcn5ccwwh9QGJjlhNI/LkzDAwsvitB/LHiYkv3LJS6aUcoDXR3+KVa7SNP436Ew
         bdWG8sI9h2AmP/Tlvga/BDD7h1nWcj+h5aMMi+rsJEPhiOE7DYOvbI5fW+I14mOFAQ
         Mvv3GPmPSGo1umBiUIPd98edkz0lv0Wu1LWH2IixJqeC3Vwmn0ie6M8jKX8icLIxkK
         z5QYjJjs8mu7pZbs29lAvz2MdGVD6/azUzlJWpIMph/OMt6srTirXDL3Y2yZNIVnAp
         2J2tBWwalA7KgVpZEt4++G6ARfNfgv2PJTXiO1mvYvPkzQx4s/NkrUC5Kh4k08Ky9d
         Ipjwl65cpyEZQ==
In-Reply-To: <20230308091539.11178-1-qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org

On Wed, Mar 8, 2023 at 3:17=E2=80=AFAM Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcLQFizaE/u3fw@public.gmane.org=
m> wrote:
>
> The overlay fragment is a special case where some properties are not
> present in the overlay source file, but in the base file.
>
> example:
> +-----------------------------+--------------------+
> | base.dts                    | overlay.dts        |
> +-----------------------------+--------------------+
> | /dts-v1/;                   | /dts-v1/;          |
> |                             | /plugin/;          |
> | /{                          |                    |
> |   parent: test {            | &parent {          |
> |     #address-cells =3D <1>;   |   child@0 {        |
> |     #size-cells =3D <0>;      |     reg =3D <0x0>;   |
> |   };                        |   };               |
> | };                          | };                 |
> +-----------------------------+--------------------+
>
> It will cause the following false alarms when compiling the overlay dts.
>
> 1. /fragment@0/__overlay__: Character '_' not recommended in node name
> 2. /fragment@0/__overlay__: Relying on default #address-cells value
> 3. /fragment@0/__overlay__: Relying on default #size-cells value
> 4. /fragment@0/__overlay__:reg: property has invalid length (4 bytes)
>    (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
>
> This workaround will fix them by skip checking for node named __overlay__=
.
>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
> V1 -> V2:
>  - Add is_overlay_node() helper
>  - Skip anything starting with "__" in check_node_name_chars_strict()
>
>  checks.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Though I do wonder if as a matter of policy on overlay structure, if
we should require an overlay to have the parent node with
#address-cells/#size-cells. In the end that would be duplicated data,
but without it there's no way to parse and validate reg/ranges in an
unapplied overlay. That's just one example issue in being able to
validate overlays.

Rob
