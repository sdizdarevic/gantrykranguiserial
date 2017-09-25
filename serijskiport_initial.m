%out = fread(s,s.BytesAvailable,'uint8');
global s1

%s1=serial('/dev/ttyS0','BaudRate',9600);
s1=serial('COM1','BaudRate',9600);
s1.InputBufferSize=1;
s1.Terminator='';
s1.Timeout=1;
fopen(s1)
