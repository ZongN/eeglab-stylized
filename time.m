[hdr, record] = edfread('eegclear.edf');
s1=record';  fs=256;
T=1; L=floor(length(s1)/T/fs)-1; L*T;
n=L*fs*T;
ss=s1(1:n,1:18);

S=fft(ss);
TL=length(ss)/fs;  Af1=fix(1*TL+1); Af2=fix(35*TL); 
EEG=WavePartition(S,fs,Af1,Af2);

% Creat export file name
FinalExportFileName = 'FinalExportFileName';

% Save to .mat
save (['..\',FinalExportFileName], 'EEG');

% Save to .edf
% Use eeglab change .mat file to .edf
EEG = pop_importdata('dataformat','matlab','nbchan',18,...
                     'data',['..\',FinalExportFileName,'.mat'],...
                     'srate',256,'pnts',0,'xmin',0,...
                     'chanlocs','kmu18.ced');
EEG = eeg_checkset( EEG );
pop_writeeeg(EEG, ['..\',FinalExportFileName,'.edf'], 'TYPE','EDF');

fprintf('EEG length : %g sec \n ',TL);

delete('data.mat','eegclear.edf','List_.mat','report.txt','..\*.asc');

clearvars
