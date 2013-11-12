" Vim syntax file
" Language: MrProc script
" Maintainer: Mikhail Borisov

if exists("b:current_syntax")
	finish
endif

" Syntax definition
syn match mrComment /^\s*#.*$/
syn match mrAssignment /^\s*\w\+\s*=\s*.*$/ contains=mrAssignmentBegin
syn match mrCommand /^\s*\w\+\s\+[^=].*$/ contains=mrCommandBegin

" Commands
syn match mrCommandBegin /^/ contained nextgroup=mrActionMR,mrActionLocal skipwhite
syn keyword mrActionMR map reduce sort drop read write copy contained nextgroup=mrArgs skipwhite
syn keyword mrActionLocal publish format fold[ing] contained nextgroup=mrArgs skipwhite

syn match mrArgs /.*/ contained contains=mrSwitch,mrString,mrVarRef,mrMacroCall
syn match mrSwitch /\s\+-\w\+/ contained 

" Assignments

syn match mrAssignmentBegin /^/ contained nextgroup=mrVarName skipwhite
syn match mrVarName /\w\+/ contained nextgroup=mrEqOp skipwhite
syn match mrEqOp /=/ contained nextgroup=mrAssignmentExpr skipwhite
syn match mrAssignmentExpr /.*$/ contained contains=mrString,mrMacroCall,mrVarRef

" Basic expressions
syn region mrString start=/"/ end=/"/ contained

syn match mrVarRef /\$\w\+/ contained
syn match mrVarRef /\$\w\+\[[0-9\-]\+\]/ contained contains=mrVarIndex
syn match mrVarIndex /\[[0-9\-]\+\]/ms=s+1,me=e-1 contained

syn region mrMacroCall start=/\${/ end=/}/ contained contains=mrMacroName,mrMacroArg,mrVarRef,mrMacroCall
syn match mrMacroName /{\s*\w\+\s/ms=s+1,me=e-1 contained
syn match mrMacroArg /\s[^\s${}]\+[\s}]/ms=s+1,me=e-1 contained


" Apply highlighting
let b:current_syntax = "mrproc"

hi def link mrComment Comment

hi def link mrVarName Identifier
hi def link mrEqOp Operator

hi def link mrActionMR Operator
hi def link mrActionLocal Operator

hi def link mrAssignmentExpr String
hi def link mrArgs String
hi def link mrString String
hi def link mrSwitch Type

hi def link mrVarRef Identifier
hi def link mrVarIndex Number

hi def link mrMacroCall Identifier
hi def link mrMacroName Operator
hi def link mrMacroArg String
