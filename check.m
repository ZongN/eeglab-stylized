clear all; close all; clc;
load CGL1020911;
s1=EEG';  fs=256;
T=5; L=fix(length(s1)/T/fs);
s_ARMethod=0;
for i=1:L   
    for j=1:18
        i1=(i-1)*T*fs+1:i*T*fs;
        delta_Pow(i,j) = my_f_Pow(s1(j,i1),fs,[1 4],s_ARMethod);
        theta_Pow(i,j) = my_f_Pow(s1(j,i1),fs,[4 8],s_ARMethod);
        alpha_Pow(i,j) = my_f_Pow(s1(j,i1),fs,[8 13],s_ARMethod);
        gamma_Pow(i,j) = my_f_Pow(s1(j,i1),fs,[13 30],s_ARMethod);
        total_Pow(i,j) = my_f_Pow(s1(j,i1),fs,[1 30],s_ARMethod);
    end    
end
mean_delta_Pow=mean(delta_Pow); mean_theta_Pow=mean(theta_Pow); 
 mean_alpha_Pow=mean(alpha_Pow); mean_gamma_Pow=mean(gamma_Pow);
 mean_total_Pow=mean(total_Pow);
for i=1:L
      line_delta_Pow(i)=norm(delta_Pow(i,:)-mean_delta_Pow);
     line_theta_Pow(i)=norm(theta_Pow(i,:)-mean_theta_Pow);
      line_alpha_Pow(i)=norm(alpha_Pow(i,:)-mean_alpha_Pow);
      line_gamma_Pow(i)=norm(gamma_Pow(i,:)-mean_gamma_Pow);
      line_total_Pow(i)=norm(total_Pow(i,:)-mean_total_Pow);
end
%sort_total_Pow=line_delta_Pow+line_theta_Pow+line_alpha_Pow+line_gamma_Pow+line_total_Pow;
sort_total_Pow=line_total_Pow;
[B,I]=sort(sort_total_Pow);
n=1:L;
plot(n,sort_total_Pow(I(n))); grid;
%break

for i=1:L   
    for j=1:18
        i1=(I(i)-1)*T*fs+1:I(i)*T*fs;
        n=(i-1)*T*fs+1:i*T*fs;
        EEG(n,j) = s1(j,i1);
    end    
end
save sort_EEG EEG
% for n=1:L
%     EEG_m=EEG((n-1)*fs*T+1:n*T*fs,:);
%    eval(['save LUA', int2str(n),'.asc EEG_m -ascii']);
% end    


