function modnum=modchange(Mod_Order,s)
leng_s=length(s);
N=log2(Mod_Order);
modnum=[];
for m=1:floor(leng_s/N)
    window=s((m-1)*N+1:m*N);
    temp=0;
    for n=1:N
        temp=temp+window(n)*2^(n-1);
    end
    modnum=[modnum temp];
end
if(mod(leng_s,N)~=0)
    window=s(leng_s+1-mod(leng_s,N):end);
    temp=0;
    for n=1:mod(leng_s,N)
        temp=temp+window(n)*2^(n-1);
    end
    modnum=[modnum temp];
end
    