%  °ªÂåload data file with txt format; and save data with mat format
clear all; close all; clc; 
% load¸ü¤JASCII½s½XtextÀÉ
load data.txt; fs=256;  s1=data;  

ss(:,1)=s1(:,2)-s1(:,13);  %Fp1
ss(:,2)=s1(:,4)-s1(:,13);  %Fp2
ss(:,3)=s1(:,6)-s1(:,13);  %F7
ss(:,4)=s1(:,7)-s1(:,13);  %F3
ss(:,5)=s1(:,8)-s1(:,13);  %Fz
ss(:,6)=s1(:,9)-s1(:,13);  %F4
ss(:,7)=s1(:,10)-s1(:,13); %F8
ss(:,8)=s1(:,11)-s1(:,13); % T3
ss(:,9)=s1(:,12)-s1(:,13); %C3
%ss(:,10)=s1(:,13); % Cz
ss(:,10)=s1(:,14)-s1(:,13); % C4
ss(:,11)=s1(:,15)-s1(:,13); % T4
ss(:,12)=s1(:,16)-s1(:,13); % T5
ss(:,13)=s1(:,17)-s1(:,13); % P3
ss(:,14)=s1(:,18)-s1(:,13); % Pz
ss(:,15)=s1(:,19)-s1(:,13); % P4
ss(:,16)=s1(:,20)-s1(:,13); % T6
ss(:,17)=s1(:,21)-s1(:,13); % O1
ss(:,18)=s1(:,23)-s1(:,13); % O2

S=fft(ss);
TL=length(ss)/fs;  Af1=fix(1*TL+1); Af2=fix(35*TL); 
ss=WavePartition(S,fs,Af1,Af2);
s=-ss;
save data s


