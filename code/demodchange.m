function s=demodchange(Mod_Order,rxSig,len)
leng=length(rxSig);
N=log2(Mod_Order);
s=[];
for m=1:leng
     temp1=rxSig(m);
    for n=1:N
    s=[s mod(temp1,2)];
    temp1=idivide(temp1,int16(2));
    end
end
s=double(s);
s=s(1:len);
