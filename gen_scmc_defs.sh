#!/bin/bash

if [ "$1" == '' ]
then
	echo usage $0 file.c.def.ss
	exit
fi
fbname=${1%.c.def.ss}
fbname=${fbname%.cu.def.ss}
fbname=${fbname%.cpp.def.ss}
echo $fbname
cat > ${fbname}_header.scmc <<_EOF
(include- "pubdefs.h")
(define-scmc-global fun-defs 
(let ((fp (open-input-file "$1"))) (reverse (read fp))))
(eval-scmc-global 
  (begin
    ;(write fun-defs current-error-port)
    (begin-map 
      (lambda (fun-def)
	(multi-define name ret type fun-def)
	\`(dec-fun ,name ,ret ,type)
	) fun-defs)))
_EOF
scmc_compile_passes ${fbname}_header.scmc C host ${fbname}.h
