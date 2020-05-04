function [TL]=Calculate_T(T)

[M,N]=size(T);  
for n=1:M
   t1=T(n,1)*3600+T(n,2)*60+T(n,3); t2=T(n,4)*3600+T(n,5)*60+T(n,6);
   TL(n)=(t2-t1)/60; 
end
TL(n+1)=sum(TL);
