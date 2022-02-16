clear all;
clc;
tic
Mod_Order=16;
rate=1/2;
cols=600;
rows=floor(cols*(1-rate));
H=genH(rows,cols);
SNR=-10:5:20;
N=50;
ber=zeros(1,length(SNR));
for a=1:length(SNR)
for n=1:N
s=round(rand(1, cols-rows));
[u,P,rearranged_cols]=ldpc_encode(s,H);
modnum=modchange(Mod_Order,u);
modSig=qammod(modnum,Mod_Order);
rxSig=awgn(modSig,SNR(1));
demodSig=qamdemod(rxSig,Mod_Order);
rs=demodchange(Mod_Order,demodSig,length(u));
llr=cal_llr(rs,SNR(a));
scale=ones(1,cols);
[uhat ,vhat]=ldpc_decode(llr,SNR(a),scale,H,rearranged_cols);
errmax=find(s~=uhat);
nerr=length(errmax);
ber(a)=ber(a)+nerr;
end
end
ber=ber/(N*(cols-rows)*log2(Mod_Order));
semilogy(SNR,ber)
xlabel('SNR')
ylabel('BER')
toc