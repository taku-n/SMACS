all: SMACS.ex5

SMACS.ex5: SMACS.mq5 SMACS.dll
	-metaeditor64.exe /compile:SMACS.mq5 /log:log.log
	cat log.log
	rm log.log

SMACS.dll: SMACS/bin/Debug/netstandard2.0/SMACS.dll
	cp SMACS/bin/Debug/netstandard2.0/SMACS.dll .

clean:
	-rm SMACS.ex5
	-rm SMACS.dll
