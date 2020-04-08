function sp=WavePartition(S,fs,f1,f2)
    [M,N]=size(S); 
    S1=zeros(M,N);   
    S1(f1:f2,:)=S(f1:f2,:);  
    S1(M-f2+2:M-f1+2,:)=S(M-f2+2:M-f1+2,:);
    sp=ifft(S1);