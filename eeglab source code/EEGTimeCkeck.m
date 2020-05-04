path = '../';
files = dir(strcat(path,'*.edf'));

% File load
% EEG = pop_importdata('dataformat','matlab','nbchan',18,...
%                      'data',strcat(path,files.name),...
%                      'srate',256,'pnts',0,'xmin',0,...
%                      'chanlocs','kmu18.ced');
% EEG = eeg_checkset( EEG );
% EEG = eeg_checkset( EEG );

[hdr, record] = edfread(strcat(path,files.name));
s1=record';  fs=256;
T=1; L=floor(length(s1)/T/fs)-1; L*T;
n=L*fs*T;
ss=s1(1:n,1:18);

S=fft(ss);
TL=length(ss)/fs;  Af1=fix(1*TL+1); Af2=fix(35*TL); 

fprintf('EEG length : %g sec \n ',TL);

delete(strcat(path,files.name))
