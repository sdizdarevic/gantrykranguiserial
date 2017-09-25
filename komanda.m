function izlaz=komanda(s1,adresa,param1)

% KOMANDA
%
% Zadavanje komande preko serijskog porta
% Sintaksa:
%           izlaz=komanda(s1,adresa,token,param1,param2)
% gdje su:
%           s1 - serial objekat
%           adresa - adresa modula: D
%         
%           param1, param2 - parametri komande
%



izlaz=[];

tekst=strcat('#',adresa);

for k=1:length(tekst)
    s1.RequestToSend='off';
    fprintf(s1,tekst(k))
end
fwrite(s1,param1)
s1.RequestToSend='on';


end

