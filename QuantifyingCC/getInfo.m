function [subNo,dataFilename,dataFilenamePrelim,practice,manipulation,session]=getInfo(varargin)
%asks for subject number and practice(0 for no practice, 1 for practice)
%via keyboard and provides subNo, practice status and file names for data.

switch nargin
    case 0
prompt1='subject number:';
subNo=input(prompt1);

prompt2='practice? Press 1 for practice and 0 for real task.';
practice=input(prompt2);

switch practice
    case 1
        prompt3=sprintf('participant %d will start practice now.',subNo);
    case 0
        prompt3=sprintf('participant %d will start the colorwheel task now.',subNo);
end
checked=input(prompt3);

    case 3
        subNo=varargin{1};
        practice=varargin{2};
        session=varargin{3};
end

manipulation = 1;

if practice==0
    dataFilename = sprintf('ColorFun_s%d_ses%d.mat',subNo,session);
    dataFilenamePrelim=sprintf('CF_s%d_ses%d_pre.mat',subNo,session);
elseif practice==1
    dataFilename = sprintf('ColorFun_s%d_ses%d_practice.mat',subNo,session);
    dataFilenamePrelim=sprintf('CF_s%d_ses%d_pre_practice.mat',subNo,session);
end

if exist (dataFilename,'file')
    randAttach = round(rand*10000);
    dataFilename = strcat(dataFilename, sprintf('_%d.mat',randAttach));  
end

