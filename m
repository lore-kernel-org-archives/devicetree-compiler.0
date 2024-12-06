Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29EF8F66
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Dec 2024 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733464113; cv=none; b=UUD+K523On8PngejTKki4tP6oNMEPPfrzNp9W0jvbiEmZ/kP3pHTIPRfrzNfrfbcgxCjMZerPHaUaP2833GpJfKHKhQy3OufBMOLsPJIZ0GqGvqbpro0a9UFA5tp0mm6gvtcCoZPyUAbh2OxAYDH8MRHDkrF8jzkSjFcmOhqiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733464113; c=relaxed/simple;
	bh=cOr7HVIqPFzjB6sr7xi25MRfY/GfGRE/oBkwO9xsvWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geJk0xGNfonp4A+rqngkHv2/SJHMhdG+6C92wS6zqvtxDnkJDSAsUZRcrvyJkTYjyxLUPC8VEWlY2Zpgde/IdAD/ElJyhppMvzbZjPTgmbZ9Z3OSmk/AT7AEq/lXli8pDPl6ZeIgLC2y+qecanI9+YEohfxU5lvMahQBkaFMmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=D/P3116z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="D/P3116z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733464101;
	bh=zRv39Y86oetxffn7Ck0UgiRg2rgl3EdAt8igDPiS+Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/P3116zB9sR++J31x+pgwDrlGYC/iNRTYWKEjbQr1RKFQWS24i8JDFw4cC/5TnDh
	 nIR37TegASqxVW+l51r6yFjTtsoEMvpS3QdzJpHLW0lgfYhSFThTe/ZDCzSU/qNyiH
	 akQCYArR0R8lLgOOAFI5LwcWz2a5R30ZHUOg4WVcLzVdma+XPCEEMH4g9L+OOwtOMp
	 sP+Etr8OBZa7o483vx//1i4TvfnQVZF2suK9QsHghVJB2I8o+cAKPAvzENbFGzd76H
	 Za5mC10zRJ4PcI3PBiQkIY+t3OVyxRzX4b2fchK4aFoEHJ5EUzQuvbEiT/c2FsruP9
	 VUVbkDbzKiFAw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y4L055qXtz4x6J; Fri,  6 Dec 2024 16:48:21 +1100 (AEDT)
Date: Fri, 6 Dec 2024 16:07:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2] Add clang-format config
Message-ID: <Z1KGnQt5W9XK1Xv2@zatzit>
References: <20241205-clang-format-v2-1-07d21007bdab@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/XegLVOiK35RxBZ3"
Content-Disposition: inline
In-Reply-To: <20241205-clang-format-v2-1-07d21007bdab@beagleboard.org>


--/XegLVOiK35RxBZ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 07:50:02PM +0530, Ayush Singh wrote:
> Add clang-format config based on Linux kernel clang-format config.
> Allows for consistent formatting rules for all future contributions.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Merged, thanks.

> ---
> Derived from the discussion in the following patch [0].
>=20
> [0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-=
b47f96dc7710@beagleboard.org/T/#m1f35fa93f8fa2d38d9c6c0e6eaf7718d69b4a7a0
> ---
> Changes in v2:
> - Update ForEachMacros list for dtc.
> - Also update the command to generate the ForEachMacros list. Not
>   specifying any particular folder since the dtc source is pretty small
>   and header files are spread out.
> - Link to v1: https://lore.kernel.org/r/20241204-clang-format-v1-1-ad9105=
ca196e@beagleboard.org
> ---
>  .clang-format | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 135 insertions(+)
>=20
> diff --git a/.clang-format b/.clang-format
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5d1518bd42c9ff296731c159=
3d94511a7d82044
> --- /dev/null
> +++ b/.clang-format
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# clang-format configuration file. Intended for clang-format >=3D 11.
> +#
> +# For more information, see:
> +#
> +#   Documentation/dev-tools/clang-format.rst
> +#   https://clang.llvm.org/docs/ClangFormat.html
> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> +#
> +---
> +AccessModifierOffset: -4
> +AlignAfterOpenBracket: Align
> +AlignConsecutiveAssignments: false
> +AlignConsecutiveDeclarations: false
> +AlignEscapedNewlines: Left
> +AlignOperands: true
> +AlignTrailingComments: false
> +AllowAllParametersOfDeclarationOnNextLine: false
> +AllowShortBlocksOnASingleLine: false
> +AllowShortCaseLabelsOnASingleLine: false
> +AllowShortFunctionsOnASingleLine: None
> +AllowShortIfStatementsOnASingleLine: false
> +AllowShortLoopsOnASingleLine: false
> +AlwaysBreakAfterDefinitionReturnType: None
> +AlwaysBreakAfterReturnType: None
> +AlwaysBreakBeforeMultilineStrings: false
> +AlwaysBreakTemplateDeclarations: false
> +BinPackArguments: true
> +BinPackParameters: true
> +BraceWrapping:
> +  AfterClass: false
> +  AfterControlStatement: false
> +  AfterEnum: false
> +  AfterFunction: true
> +  AfterNamespace: true
> +  AfterObjCDeclaration: false
> +  AfterStruct: false
> +  AfterUnion: false
> +  AfterExternBlock: false
> +  BeforeCatch: false
> +  BeforeElse: false
> +  IndentBraces: false
> +  SplitEmptyFunction: true
> +  SplitEmptyRecord: true
> +  SplitEmptyNamespace: true
> +BreakBeforeBinaryOperators: None
> +BreakBeforeBraces: Custom
> +BreakBeforeInheritanceComma: false
> +BreakBeforeTernaryOperators: false
> +BreakConstructorInitializersBeforeComma: false
> +BreakConstructorInitializers: BeforeComma
> +BreakAfterJavaFieldAnnotations: false
> +BreakStringLiterals: false
> +ColumnLimit: 80
> +CommentPragmas: '^ IWYU pragma:'
> +CompactNamespaces: false
> +ConstructorInitializerAllOnOneLineOrOnePerLine: false
> +ConstructorInitializerIndentWidth: 8
> +ContinuationIndentWidth: 8
> +Cpp11BracedListStyle: false
> +DerivePointerAlignment: false
> +DisableFormat: false
> +ExperimentalAutoDetectBinPacking: false
> +FixNamespaceComments: false
> +
> +# Taken from:
> +#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' \
> +#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1=
'," \
> +#   | LC_ALL=3DC sort -u
> +ForEachMacros:
> +  - 'fdt_for_each_property_offset'
> +  - 'fdt_for_each_subnode'
> +  - 'for_each_child'
> +  - 'for_each_child_withdel'
> +  - 'for_each_label'
> +  - 'for_each_label_withdel'
> +  - 'for_each_marker'
> +  - 'for_each_marker_of_type'
> +  - 'for_each_property'
> +  - 'for_each_property_withdel'
> +
> +IncludeBlocks: Preserve
> +IncludeCategories:
> +  - Regex: '.*'
> +    Priority: 1
> +IncludeIsMainRegex: '(Test)?$'
> +IndentCaseLabels: false
> +IndentGotoLabels: false
> +IndentPPDirectives: None
> +IndentWidth: 8
> +IndentWrappedFunctionNames: false
> +JavaScriptQuotes: Leave
> +JavaScriptWrapImports: true
> +KeepEmptyLinesAtTheStartOfBlocks: false
> +MacroBlockBegin: ''
> +MacroBlockEnd: ''
> +MaxEmptyLinesToKeep: 1
> +NamespaceIndentation: None
> +ObjCBinPackProtocolList: Auto
> +ObjCBlockIndentWidth: 8
> +ObjCSpaceAfterProperty: true
> +ObjCSpaceBeforeProtocolList: true
> +
> +# Taken from git's rules
> +PenaltyBreakAssignment: 10
> +PenaltyBreakBeforeFirstCallParameter: 30
> +PenaltyBreakComment: 10
> +PenaltyBreakFirstLessLess: 0
> +PenaltyBreakString: 10
> +PenaltyExcessCharacter: 100
> +PenaltyReturnTypeOnItsOwnLine: 60
> +
> +PointerAlignment: Right
> +ReflowComments: false
> +SortIncludes: false
> +SortUsingDeclarations: false
> +SpaceAfterCStyleCast: false
> +SpaceAfterTemplateKeyword: true
> +SpaceBeforeAssignmentOperators: true
> +SpaceBeforeCtorInitializerColon: true
> +SpaceBeforeInheritanceColon: true
> +SpaceBeforeParens: ControlStatementsExceptForEachMacros
> +SpaceBeforeRangeBasedForLoopColon: true
> +SpaceInEmptyParentheses: false
> +SpacesBeforeTrailingComments: 1
> +SpacesInAngles: false
> +SpacesInContainerLiterals: false
> +SpacesInCStyleCastParentheses: false
> +SpacesInParentheses: false
> +SpacesInSquareBrackets: false
> +Standard: Cpp03
> +TabWidth: 8
> +UseTab: Always
> +...
>=20
> ---
> base-commit: 6f183c7d9246bde8f05d2edbc31fdd497c4a8702
> change-id: 20241204-clang-format-2536dd18a7c5
>=20
> Best regards,

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/XegLVOiK35RxBZ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdShp0ACgkQzQJF27ox
2GeWJg/9GPs3hZKVJBjJHB7tyiFKbdaYtTHZg5KkqQiX+l1ONIF7GnWoum7OgsJG
wgGJlgzNpEmyANW/ZJpYOUHyOnSTCWc0YCnCd3eshmJ/p8Fa4sZHsy6oXJmkPiQi
cNLnIKjo3inhSKg4GMeOTmgT+wxM5gyelXtqO2ZpP1IGmyufB/XuXhw4kqIyiWBs
Ls6pQjKd6r/aFMEg26ov+uBDXz+VIEAJ4aMmspTNTAmqpnStE4moMGO2Ux9cu3uU
uLCgeHLG+hxFFWxbfveeJNdAbw7mJDPSqr2JWS52772B1hGeJPVweynDjXcYErfw
BS/Xzyuaz6KNoGgzzBMNbVIa3C8kuITFA5YjAr4W5vc6vD+Z2ql/ErYy4Xv/wj0K
Wx4M7mbbYxzGbKeoaP9NDlEzPZaSj1g5IhJBbaNLDxgEk8OmoU8R5FhIodAvDGQy
+x3die9+9tveu/kCvWLWUQ3X8CjivCXfizVTFHx3B/BIqQrYVb4PC2MCwKeveMu3
9OJNBESGPn32hrhioSzqFGut/kQs3oekfOjsSEhr2YAmXALGfG79RfI0WsC9EA/a
LmmREKva0TA7wjpa/L7+dLDbiwAtX9uxbo8m4UEvj/3L7jrX4/f7O6x6D/F6Kw0k
2JPbFtSYBFLIuPTycoNlJx0dqVqF8BcytaWgPHvq/YxyqhwsySk=
=G3m7
-----END PGP SIGNATURE-----

--/XegLVOiK35RxBZ3--
