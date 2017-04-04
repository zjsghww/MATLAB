%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Matlab source codes for                              %
%       Regularized Common Spatial Pattern with Aggregation (R-CSP-A)         %
%                                                                             %
% Author: Haiping LU                                                          %
% Email : hplu@ieee.org   or   eehplu@gmail.com                               %
% Release date: March 20, 2012                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%[Algorithm]%

The matlab codes provided here implement the R-CSP-A algorithm presented in the 
paper "R-CSP-A_TBME2010.pdf" included in this package:

    Haiping Lu, How-Lung Eng, Cuntai Guan, K.N. Plataniotis, and A.N. Venetsanopoulos,
    "Regularized Common Spatial Pattern With Aggregation for EEG Classification 
    in Small-Sample Setting",
    IEEE Trans. on Biomedical Engineering, 
    Vol. 57, No. 12, pp. 2936-2946, Dec. 2010.


The following is an earlier conference version "RCSP_EMBC09.pdf"

    Haiping Lu, K.N. Plataniotis, and A.N. Venetsanopoulos,
    "Regularized Common Spatial Patterns with Generic Learning for EEG Signal Classification",
    in Proceedings of the 31st Annual International Conference of the 
    IEEE Engineering in Medicine and Biology Society (EMBC), Sep., 2009.

[Files]
RegCsp.m:         the Regularized Common Spatial Pattern (R-CSP) algorithm 
demoR-CSP-Aggr.m: sample code for R-CSP aggregation
FDA.m:            perform Fisher’s discriminant analysis (FDA) 
---------------------------


%[Usages]%

Please refer to "demoR-CSP-Aggr.m" for example usage 
---------------------------


%[Restriction]%

In all documents and papers reporting research work that uses the matlab codes 
provided here, the respective author(s) must reference the following paper: 

[1]	Haiping Lu, How-Lung Eng, Cuntai Guan, K.N. Plataniotis, and A.N. Venetsanopoulos,
        "Regularized Common Spatial Pattern With Aggregation for EEG 
        Classification in Small-Sample Setting",
        IEEE Trans. on Biomedical Engineering, 
        Vol. 57, No. 12, pp. 2936-2946, Dec. 2010.
---------------------------


%[Additional Resources]%

The BibTeX file "RCSPpublications.bib" contains the BibTex for R-CSP-A and 
related works. A related work "UMLDA_TNN09.pdf" is included too.
---------------------------


%[Comment/Question?]%

Please send your comment (e.g., ways to improve the codes) or question (e.g., 
difficulty in using the codes) to hplu@ieee.org or eehplu@gmail.com
---------------------------


%[Update history]%

1. March 20, 2012: Version 1.0 is released.