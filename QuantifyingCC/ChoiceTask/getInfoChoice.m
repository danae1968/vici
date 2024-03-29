function [subNo,dataFilename,dataFilenamePrelim,practice]=getInfoChoice(varargin)
%gives subject number

switch nargin
    case 0
prompt1='subject number:';
subNo=input(prompt1);

prompt2='practice? Press 1 for practice and 0 for real task.';
practice=input(prompt2);
switch practice
    case 1
        prompt3=sprintf('participant %d will start practice now',subNo);
    case 0
        prompt3=sprintf('participant %d will start the choice task now',subNo);
end

checked=input(prompt3);
    case 2
        subNo=varargin{1};
        practice=varargin{2};
end
        
if practice==0
    dataFilename = sprintf('ColorFunChoice_s%d.mat',subNo);
    dataFilenamePrelim=sprintf('CFChoice_s%d_pre.mat',subNo);
elseif practice==1
    dataFilename = sprintf('ColorFunChoice_s%d_practice.mat',subNo);
    dataFilenamePrelim=sprintf('CFChoice_s%d_pre_practice.mat',subNo);
end

if exist (dataFilename,'file')
    randAttach = round(rand*10000);
    dataFilename = strcat(dataFilename, sprintf('_%d.mat',randAttach));  
    if exist (dataFilenamePrelim, 'file')
        dataFilenamePrelim = strcat(dataFilenamePrelim, sprintf('_%d.mat',randAttach));
    end
end
end

