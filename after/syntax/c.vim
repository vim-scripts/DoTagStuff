" -----------------------------------------------------------------------------

if version < 600
     " No autoloading, before version 6
     so /usr/local/share/vim/vimfiles/autoload/DoTagStuff.vim
endif

" We're doing setting up syntax groups for these tags here, *BEFORE* defining
" much else because we want these to have a relatively low precedence.
"
" e.g., We put some macros in the cExternalLibFunction syntax group because
" they're macros that are "replacements" for functions and we'd like them to
" be highlighted like a function.  Those defines will get picked up here as
" #define's (macros), so we define these groups first, then the subsequently
" defined tokens in the cExternalLibFunction group will take precedence over
" these so they'll be highlighted as a function instead of a macro.

"	EN	Enumeration names
"	UN	Union names
"	SN	Structure names
"	M	Macros (#defines)
"	C	Constants (including constant-looking, non-macro, #defines)
"	E	Enumerators
"	LV	Local variables
"
"	G	Globals		(external only)
"
call DoTagStuff("EN UN SN M C E LV extern G")

" -----------------------------------------------------------------------------

" Define some common system functions (that are not automatically picked up
" from tags) as members of the library function group.
syn keyword	cExternalLibFunction	printf fprintf sprintf snprintf getenv fflush fileno dup dup2 strerror
syn keyword	cExternalLibFunction	strcat strncat strcmp strncmp strcasecmp strncasecmp strcpy strncpy strdup strlen strchr strrchr strpbrk strpbrk strspn strcspn strstr strtok strtok_r strcoll
syn keyword	cExternalLibFunction	isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit isascii
syn keyword	cExternalLibFunction	atoi atol atof floor ceil abs fabs rint

" -----------------------------------------------------------------------------

" Define macros we want to highlight as functions as members of the library
" function group.

syn keyword	cExternalLibFunction	fopen fclose fgetline fseek ftell rewind open close fdopen unlink getchar getc ungetc fgetc putchar putc fputc puts fputs fwrite

" -----------------------------------------------------------------------------

" Make offsetof like sizeof.
syn keyword	cOperator	offsetof

" -----------------------------------------------------------------------------
" These #defines are simple constants, so we'd like them highlighted as
" constants instead of #defines.
"
syn keyword cExternalLibConstant	NULL EOF

" Some common standard global variables that aren't picked up in any tags files.
syn keyword cExternalLibGlobal		stdin stdout stderr errno

" -----------------------------------------------------------------------------

hi	cStorageClass		guifg=#229922
hi	cStructure		guifg=DarkGreen

" The following general guidelines were used to choose the colors for these groups:
"
" The cStatic<thing>, cStaticLib<thing>, and cStaticUnify<thing> are all the
" same; i.e., if it's static to a library or Unify file, the only time the
" group item would be present was when editing the file the tag was from, so we
" want 'normal' highlighting for that type of <thing>.
"
" The cExternal<thing> is the same color as the cStatic<thing>, with bolding
" added.
"
" The cExternalLib<thing> is a darker flavor of the cExternal<thing> (still with
" bolding).
"
" The cExternalUnify<thing> is the same as cExternalLib<thing>, with
" underlining added.
"
" An exception to these guidelines is the Types; all types are bolded, so
" darker flavored colors are used instead.

hi	cStaticConstant						guifg=#CC00DD
hi link	cStaticLibConstant							cStaticConstant
hi link	cStaticUnifyConstant							cStaticConstant

hi	cExternalConstant		gui=bold		guifg=#CC00DD
hi	cExternalLibConstant		gui=bold		guifg=#9900AA
hi	cExternalUnifyConstant		gui=bold,underline	guifg=#9900AA

hi	cStaticEnumName						guifg=Salmon
hi link	cStaticLibEnumName							cStaticEnumName
hi link	cStaticUnifyEnumName							cStaticEnumName

hi	cExternalEnumName		gui=bold		guifg=Salmon
hi	cExternalLibEnumName		gui=bold		guifg=DarkSalmon
hi	cExternalUnifyEnumName		gui=bold,underline	guifg=DarkSalmon

hi	cStaticEnumerator					guifg=#FF6699
hi link	cStaticLibEnumerator							cStaticEnumerator
hi link	cStaticUnifyEnumerator							cStaticEnumerator

hi	cExternalEnumerator		gui=bold		guifg=#FF6699
hi	cExternalLibEnumerator		gui=bold		guifg=#E06699
hi	cExternalUnifyEnumerator	gui=bold,underline	guifg=#E06699

hi	cStaticFunction						guifg=#C00000
hi link	cStaticLibFunction							cStaticFunction
hi link	cStaticUnifyFunction							cStaticFunction

hi	cExternalFunction		gui=bold		guifg=#C00000
hi	cExternalLibFunction		gui=bold		guifg=#700000
hi	cExternalUnifyFunction		gui=bold,underline	guifg=#700000

hi	cStaticGlobal						guifg=#0099DD
hi link	cStaticLibGlobal							cStaticGlobal
hi link	cStaticUnifyGlobal							cStaticGlobal

hi	cExternalGlobal			gui=bold		guifg=#0099DD
hi	cExternalLibGlobal		gui=bold		guifg=#0066AA
hi	cExternalUnifyGlobal		gui=bold,underline	guifg=#0066AA

hi	cStaticLocal						guifg=#505000
hi link	cStaticLibLocal								cStaticLocal
hi link	cStaticUnifyLocal							cStaticLocal

hi	cDynamicLocal						guifg=#707000
hi link	cDynamicLibLocal							cDynamicLocal
hi link	cDynamicUnifyLocal							cDynamicLocal

hi	cStaticMacro						guifg=Purple
hi link	cStaticLibMacro								cStaticMacro
hi link	cStaticUnifyMacro							cStaticMacro

hi	cExternalMacro			gui=bold		guifg=Purple
hi	cExternalLibMacro		gui=bold		guifg=#8000D0
hi	cExternalUnifyMacro		gui=bold,underline	guifg=#8000D0

hi link	cStaticStructName							cStaticEnumName
hi link	cStaticLibStructName							cStaticLibEnumName
hi link	cStaticUnifyStructName							cStaticUnifyEnumName

hi link	cExternalStructName							cExternalEnumName
hi link	cExternalLibStructName							cExternalLibEnumName
hi link	cExternalUnifyStructName						cExternalUnifyEnumName

hi	cStaticType			gui=bold		guifg=#44BB44
hi link	cStaticLibType								cStaticType
hi link	cStaticUnifyType							cStaticType

hi	cExternalType			gui=bold		guifg=#2AA12A
hi	cExternalLibType		gui=bold		guifg=SeaGreen
hi	cExternalUnifyType		gui=bold		guifg=DarkGreen

hi link	cStaticUnionName							cStaticEnumName
hi link	cStaticLibUnionName							cStaticLibEnumName
hi link	cStaticUnifyUnionName							cStaticUnifyEnumName

hi link	cExternalUnionName							cExternalEnumName
hi link	cExternalLibUnionName							cExternalLibEnumName
hi link	cExternalUnifyUnionName							cExternalUnifyEnumName

" NOTE: This is done AFTER the database fields' syntax highlighting has been
"       setup, so that these take precedence over database entities.
"
"	T	Types
"	F	Functions
"	G	Globals		(static only; i.e., file-local globals)
"
call DoTagStuff("T F static G")

" -----------------------------------------------------------------------------
" NOTE: This is done *after* DoTagStuff so that we override the group that
"       would be picked up via the tags file (e.g., plain cExternalType).

" Highlight some standard defines as types.
syn keyword	cExternalLibType	FILE time_t pid_t size_t

" =============================================================================
