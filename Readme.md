# eeglab-stylized
## Introduction
This repositories is based on [*eeglab*](https://github.com/sccn/eeglab), thanks for the existence of *eeglab*.

It's one of the *Matlab's toolbox*. People can use it to easily process [eeg](https://en.wikipedia.org/wiki/Electroencephalography), include *ICA*、 *adjust*..., there are more information in [*EEGLAB Wiki*](https://sccn.ucsd.edu/wiki/EEGLAB).

It has a perfect UI interface for people to use, but I often need to deal with a lot of eeg, this process includes reading, running ICA, running ADjust, exporting, etc. 

So I captured the some source code and let it execute automatically.

## Environment
<escape>
  <table>
  <tr>
    <th>Name</th>
    <th>My version</th>
    <th>LinK</th>
  </tr>
  <tr>
    <td>Matlab</td>
    <td>R2018a Update2</td>
    <td><a href="https://www.mathworks.com/products/matlab.html)" target="_blank" title="mathworks">Here</a></td>
  </tr>
  <tr>
    <td colspan="3" align="center">eeglab</td>
  </tr>
  <tr>
    <td>eeglab toolbox</td>
    <td>14.1.2.0 </td>
    <td><a href="https://sccn.ucsd.edu/eeglab/download.php)" target="_blank" title="eeglab toolbox">Here</a></td>
  </tr>
  <tr>
    <td>ADJUST</td>
    <td>1.1.1</td>
    <td><a href="https://www.nitrc.org/projects/adjust/)" target="_blank" title="ADJUST">Here</a></td>
  </tr>
</table>
</escape>

![](https://img.shields.io/badge/Matlab-R2018a%20Update2-orange) ![](https://img.shields.io/badge/eeglab%20toolbox-14.1.2.0-green) ![](https://img.shields.io/badge/ADJUST-1.1.1-blue) 

## Input/Output
Input :
* eeg raw data:
  > Column : Channel(A1、A2、Fp1、Fp2...)
  
  > Row : Value of time series
  
Output :
* Processed .edf file and .mat file

## Processt
data.mat ▶ eeglab_AutoRun.m ▶ Run ICA ▶ Run ADJUST ▶ Manual confirmation and reject ▶ time.m ▶ Result

## Some detail of the source code
* I used 18 electrode channels as input.
* Hertz is 256.
* Channel information is written in *Inf18.ced* file.
* Output file name can change in *time.m*.
