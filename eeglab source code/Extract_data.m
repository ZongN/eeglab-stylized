function s=Extraxt_Data(T0,T,fs,sb)

t0=T0(1)*3600+T0(2)*60+T0(3); 
t1=T(1)*3600+T(2)*60+T(3);
t2=T(4)*3600+T(5)*60+T(6);
a=fix((t1-t0)*fs);  b=fix((t2-t0)*fs)-1;
index=a:b;
s=sb(index,:);   

