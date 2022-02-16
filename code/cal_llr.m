function llr=cal_llr(u,SNR)
a=-pskmod(u,2);
llr=awgn(a,SNR);