% .asc file load
ASCFileLoad

% Set srate(Hz)
fs=256;

% Channels calculate
ss(:,1)=table2array(ASC_data(:,'Fp1'))-table2array(ASC_data(:,'Cz'));  %Fp1
ss(:,2)=table2array(ASC_data(:,'Fp2'))-table2array(ASC_data(:,'Cz')); %Fp2
ss(:,3)=table2array(ASC_data(:,'F7'))-table2array(ASC_data(:,'Cz'));  %F7
ss(:,4)=table2array(ASC_data(:,'F3'))-table2array(ASC_data(:,'Cz'));  %F3
ss(:,5)=table2array(ASC_data(:,'Fz'))-table2array(ASC_data(:,'Cz'));  %Fz
ss(:,6)=table2array(ASC_data(:,'F4'))-table2array(ASC_data(:,'Cz'));  %F4
ss(:,7)=table2array(ASC_data(:,'F8'))-table2array(ASC_data(:,'Cz')); %F8
ss(:,8)=table2array(ASC_data(:,'T3'))-table2array(ASC_data(:,'Cz')); % T3
ss(:,9)=table2array(ASC_data(:,'C3'))-table2array(ASC_data(:,'Cz')); %C3
ss(:,10)=table2array(ASC_data(:,'C4'))-table2array(ASC_data(:,'Cz')); % C4
ss(:,11)=table2array(ASC_data(:,'T4'))-table2array(ASC_data(:,'Cz')); % T4
ss(:,12)=table2array(ASC_data(:,'T5'))-table2array(ASC_data(:,'Cz')); % T5
ss(:,13)=table2array(ASC_data(:,'P3'))-table2array(ASC_data(:,'Cz')); % P3
ss(:,14)=table2array(ASC_data(:,'Pz'))-table2array(ASC_data(:,'Cz')); % Pz
ss(:,15)=table2array(ASC_data(:,'P4'))-table2array(ASC_data(:,'Cz')); % P4
ss(:,16)=table2array(ASC_data(:,'T6'))-table2array(ASC_data(:,'Cz')); % T6
ss(:,17)=table2array(ASC_data(:,'O1'))-table2array(ASC_data(:,'Cz')); % O1
ss(:,18)=table2array(ASC_data(:,'O2'))-table2array(ASC_data(:,'Cz')); % O2

S=fft(ss);
TL=length(ss)/fs;  Af1=fix(1*TL+1); Af2=fix(35*TL); 
ss=WavePartition(S,fs,Af1,Af2);
s=-ss;
save data s


%{
    2019.11.19 eeglab_AutoRun
    Run eeglab include 1.load data.mat 
                       2.set channel number (18) and requency (256 Hz)
                       3.import channel information file (kmu18.ced)
                       4.run ICA
                       5.run ADJUST
                       6.remove adjusted channels components
                       7.plot the eeg result after ica and adjust
                       8.manual confirmation
                       9.export eegclear.edf file
    eeglab stage completed
%}
eeglab_AutoRun

time

