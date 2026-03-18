
R version 4.5.2 (2025-10-31 ucrt) -- "[Not] Part in a Rumble"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> drug <- read.csv("C:/Users/dylan/Downloads/GDSC2_fitted_dose_response_27Oct23.csv")
> mutations <- read.csv("C:/Users/dylan/Downloads/mutations_all_20230202.csv")
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
  In file(file, "rt") :
  cannot open file 'C:/Users/dylan/Downloads/mutations_all_20230202.csv': No such file or directory

> list.files("C:/Users/dylan/Downloads")
[1] "02257feb-5c31-4f91-af46-6fc90dbdd644.xlsx - Sheet1.csv"
[2] "2024 Youreka Canada Journal.pdf"                       
[3] "2026 Lecture slide 4.pptx"                             
[4] "2026 Lecture slide 5.pptx"                             
[5] "2026 Lecture slide 6.pptx"                             
[6] "2026 Lecture slide 7 (last).pptx"                      
[7] "2026 sample datasets.pdf"                              
[8] "98100085-fra.zip"                                      
[9] "98100094-fra.zip"                                      
[10] "ACLib"                                                 
[11] "Activity Waiver Form 2025.pdf"                         
[12] "Anki Flashcards.apkg"                                  
[13] "cell thing temo.csv"                                   
[14] "DEMO_L.xpt"                                            
[15] "desktop.ini"                                           
[16] "DR1IFF_L.xpt"                                          
[17] "drug-event-0001-of-0005.json.zip"                      
[18] "drug-event-0014-of-0029.json.zip"                      
[19] "extract_extrait"                                       
[20] "extract_extrait.zip"                                   
[21] "GDSC2_fitted_dose_response_27Oct23.csv"                
[22] "GDSC2_fitted_dose_response_27Oct23.xlsx"               
[23] "Git-2.53.0.2-64-bit.exe"                               
[24] "Human Deases - 8th Edition.pdf"                        
[25] "josie default edit.zip"                                
[26] "medicines-output-medicines-report_en.xlsx"             
[27] "Microsoft.Services.Store.winmd"                        
[28] "mutations_all_20260316"                                
[29] "mutations_all_20260316.csv"                            
[30] "mutations_all_20260316.zip"                            
[31] "NCT04380142.json"                                      
[32] "Participant Media Agreement and Release-2025.pdf"      
[33] "Pathophysiology KEY.docx.html"                         
[34] "Pathophysiology KEY.docx_files"                        
[35] "Pathophysiology TEST.docx.html"                        
[36] "Pathophysiology TEST.docx_files"                       
[37] "Practical_3_Walkthrough.Rmd"                           
[38] "R-4.5.2-win (1).exe"                                   
[39] "R-4.5.2-win.exe"                                       
[40] "R vignette 2.Rmd"                                      
[41] "R vignette 3.Rmd"                                      
[42] "R vignette 4.Rmd"                                      
[43] "R vignette 5.Rmd"                                      
[44] "R vignette 6.Rmd"                                      
[45] "rainboe dog.png"                                       
[46] "RStudio-2026.01.0-392.exe"                             
[47] "Stage_Academy_Workbook_-_2024 (1).pdf"                 
[48] "teamname_final_data.csv"                               
[49] "teamname_practical1.csv"                               
[50] "teamname_practical4.R"                                 
[51] "University of Michigan - BlueLink Atlas.apkg"          
[52] "WhatsApp Installer.exe"                                
[53] "YourTeamName_practical1.csv"                           
[54] "YourTeamName_practical1.R"                             
> mutations <- read.csv("C:/Users/dylan/Downloads/mutations_all_20260316.csv")
> dim(drug)
[1] 242036     16
> dim(mutations)
[1] 11493668       19
> ls()
[1] "drug"      "mutations"
> save.image("youreka_cancer.RData")
> mut_small <- mutations[mutations$gene_symbol %in% c("PTEN", "MGMT"), ]
> dim(mut_small)
[1] 2845   19
> View(mut_small)
> merged_data <- merge(drug, mut_small,
                       +                      by.x = "SANGER_MODEL_ID",
                       +                      by.y = "model_id")
> View(merged_data)
> uli_lung <- subset(merged_data,
                     +                    DRUG_NAME == "Ulixertinib" &
                       +                        CANCER_TYPE == "Non-Small Cell Lung Carcinoma")
> View(uli_lung)
> pten <- uli_lung[uli_lung$gene_symbol == "PTEN", ]
> mgmt <- uli_lung[uli_lung$gene_symbol == "MGMT", ]
> View(mgmt)
> View(pten)
> View(mut_small)
> View(pten)
> View(pten)
> mut_small <- mutations[mutations$gene_symbol %in% c("PTEN", "MGMT"), ]
> merged_data <- merge(drug, mut_small,
                       +                      by.x = "SANGER_MODEL_ID",
                       +                      by.y = "model_id")
> dim(merged_data)
[1] 163025     34
> head(merged_data[, c("SANGER_MODEL_ID","DRUG_NAME","gene_symbol","LN_IC50")])
SANGER_MODEL_ID    DRUG_NAME gene_symbol  LN_IC50
1       SIDM00044 Methotrexate        MGMT 0.741337
2       SIDM00044   NVP-ADW742        MGMT 4.222638
3       SIDM00044        TW 37        MGMT 2.781820
4       SIDM00044  Osimertinib        MGMT 1.394601
5       SIDM00044    Cediranib        MGMT 2.330831
6       SIDM00044   Vismodegib        MGMT 6.170389
> uli_lung <- subset(merged_data,
                     +                    DRUG_NAME == "Ulixertinib" &
                       +                        CANCER_TYPE == "Non-Small Cell Lung Carcinoma")
> head(uli_lung[, c("SANGER_MODEL_ID","gene_symbol")])
SANGER_MODEL_ID gene_symbol
5372       SIDM00119        MGMT
7266       SIDM00133        MGMT
7403       SIDM00133        MGMT
7833       SIDM00138        PTEN
7834       SIDM00138        MGMT
7835       SIDM00138        MGMT
> pten_rows <- uli_lung[uli_lung$gene_symbol == "PTEN", ]
> View(pten_rows)
> head(pten_rows)
SANGER_MODEL_ID DATASET NLME_RESULT_ID NLME_CURVE_ID CELL_LINE_NAME
7833        SIDM00138   GDSC2            343      15990450        NCI-H23
8184        SIDM00138   GDSC2            343      15990492        NCI-H23
33826       SIDM00297   GDSC2            343      16039594        LC-2-ad
34778       SIDM00306   GDSC2            343      16089993          IA-LM
34789       SIDM00306   GDSC2            343      16089951          IA-LM
73009       SIDM00547   GDSC2            343      15967407          LU-65
CANCER_TYPE DRUG_ID   DRUG_NAME PUTATIVE_TARGET       PATHWAY_NAME
7833  Non-Small Cell Lung Carcinoma    1908 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
8184  Non-Small Cell Lung Carcinoma    2047 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
33826 Non-Small Cell Lung Carcinoma    1908 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
34778 Non-Small Cell Lung Carcinoma    2047 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
34789 Non-Small Cell Lung Carcinoma    1908 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
73009 Non-Small Cell Lung Carcinoma    2047 Ulixertinib      ERK1, ERK2 ERK MAPK signaling
MIN_CONC MAX_CONC  LN_IC50      AUC     RMSE   Z_SCORE gene_symbol ensembl_gene_id
7833  0.010005       10 2.349406 0.889569 0.122643 -0.317739        PTEN ENSG00000171862
8184  0.002001        2 2.933827 0.978550 0.020475  0.466325        PTEN ENSG00000171862
33826 0.010005       10 3.094357 0.932275 0.045019  0.206080        PTEN ENSG00000171862
34778 0.002001        2 0.403299 0.840555 0.053592 -1.179686        PTEN ENSG00000171862
34789 0.010005       10 4.025407 0.949557 0.093617  0.860756        PTEN ENSG00000171862
73009 0.002001        2 0.712752 0.833276 0.094700 -0.978398        PTEN ENSG00000171862
transcript_id model_name protein_mutation rna_mutation cdna_mutation chromosome position
7833      CCDS31238    NCI-H23              p.?    r.5368g>u           c.?      chr10 87968783
8184      CCDS31238    NCI-H23              p.?    r.5368g>u           c.?      chr10 87968783
33826     CCDS31238    LC-2-ad              p.?     r.837c>g           c.?      chr10 87864461
34778     CCDS31238      IA-LM                -          r.?             -      chr10 87945889
34789     CCDS31238      IA-LM                -          r.?             -      chr10 87945889
73009     CCDS31238      LU-65                -          r.?             -      chr10 87932812
reference alternative cancer_driver cancer_predisposition_variant             effect
7833          G           T             f                             f 3prime_UTR_variant
8184          G           T             f                             f 3prime_UTR_variant
33826         C           G             f                             f 5prime_UTR_variant
34778         A           G             f                             f           intronic
34789         A           G             f                             f           intronic
73009         A           T             f                             f           intronic
vaf coding source   gene_id
7833  1.0000      f Sanger SIDG26200
8184  1.0000      f Sanger SIDG26200
33826 0.4214      f Sanger SIDG26200
34778 1.0000      f Sanger SIDG26200
34789 1.0000      f Sanger SIDG26200
73009 0.6000      f Sanger SIDG26200
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union
> 
  > clean_data <- merged_data %>%
  +     group_by(SANGER_MODEL_ID, DRUG_NAME, CANCER_TYPE, LN_IC50) %>%
  +     summarise(
    +         PTEN_mut = any(gene_symbol == "PTEN"),
    +         MGMT_mut = any(gene_symbol == "MGMT")
    +     )
`summarise()` has regrouped the output.
ℹ Summaries were computed grouped by SANGER_MODEL_ID, DRUG_NAME, CANCER_TYPE, and LN_IC50.
ℹ Output is grouped by SANGER_MODEL_ID, DRUG_NAME, and CANCER_TYPE.
ℹ Use `summarise(.groups = "drop_last")` to silence this message.
ℹ Use `summarise(.by = c(SANGER_MODEL_ID, DRUG_NAME, CANCER_TYPE, LN_IC50))` for per-operation
grouping instead.
> View(clean_data)
> uli_lung_clean <- clean_data %>%
  +     filter(DRUG_NAME == "Ulixertinib",
               +            CANCER_TYPE == "Non-Small Cell Lung Carcinoma")
> View(uli_lung_clean)
> nrow(uli_lung_clean)
[1] 39
> 
  > library(dplyr)
> 
  > clean_data <- merged_data %>%
  +     group_by(SANGER_MODEL_ID, DRUG_NAME, CANCER_TYPE) %>%
  +     summarise(
    +         LN_IC50 = first(LN_IC50),
    +         PTEN_mut = any(gene_symbol == "PTEN"),
    +         MGMT_mut = any(gene_symbol == "MGMT"),
    +         .groups = "drop"
    +     )
> View(uli_lung_clean)
> uli_lung_clean <- clean_data %>%
  +     filter(
    +         DRUG_NAME == "Ulixertinib",
    +         CANCER_TYPE == "Non-Small Cell Lung Carcinoma"
    +     )
> nrow(uli_lung_clean)
[1] 23
> View(uli_lung_clean)
> table(duplicated(uli_lung_clean$SANGER_MODEL_ID))

FALSE 
23 
> length(unique(uli_lung_clean$SANGER_MODEL_ID))
[1] 23
> gbm_temo <- clean_data %>%
  +     filter(
    +         DRUG_NAME == "Temozolomide",
    +         CANCER_TYPE == "Glioblastoma"
    +     )
> 
  > nrow(gbm_temo)
[1] 27
> View(gbm_temo)
> View(uli_lung_clean)
> library(dplyr)
> 
  > gbm_temo <- gbm_temo %>%
  +     mutate(group = case_when(
    +         PTEN_mut & MGMT_mut ~ "PTEN + MGMT",
    +         PTEN_mut & !MGMT_mut ~ "PTEN only",
    +         !PTEN_mut & MGMT_mut ~ "MGMT only",
    +         TRUE ~ "Neither"
    +     ))
> 
  > boxplot(LN_IC50 ~ group,
            +         data = gbm_temo,
            +         main = "Temozolomide response by mutation group",
            +         xlab = "Mutation group",
            +         ylab = "LN_IC50")
> stripchart(LN_IC50 ~ group,
             +            data = gbm_temo,
             +            vertical = TRUE,
             +            method = "jitter",
             +            pch = 19,
             +            add = TRUE)
> hist(gbm_temo$LN_IC50,
       +      main = "Distribution of LN_IC50",
       +      xlab = "LN_IC50")
> t.test(LN_IC50 ~ PTEN_mut, data = gbm_temo)

Welch Two Sample t-test

data:  LN_IC50 by PTEN_mut
t = 0.38189, df = 7.0993, p-value = 0.7137
alternative hypothesis: true difference in means between group FALSE and group TRUE is not equal to 0
95 percent confidence interval:
  -1.287219  1.784755
sample estimates:
  mean in group FALSE  mean in group TRUE 
6.628471            6.379703 

> t.test(LN_IC50 ~ MGMT_mut, data = gbm_temo)

Welch Two Sample t-test

data:  LN_IC50 by MGMT_mut
t = -0.72487, df = 16.984, p-value = 0.4784
alternative hypothesis: true difference in means between group FALSE and group TRUE is not equal to 0
95 percent confidence interval:
  -1.2544562  0.6129272
sample estimates:
  mean in group FALSE  mean in group TRUE 
6.301637            6.622401 

> anova_model <- aov(LN_IC50 ~ group, data = gbm_temo)
> summary(anova_model)
Df Sum Sq Mean Sq F value Pr(>F)
group        2  0.687  0.3433   0.282  0.757
Residuals   24 29.192  1.2163               
> wilcox.test(LN_IC50 ~ PTEN_mut, data = gbm_temo)

Wilcoxon rank sum exact test

data:  LN_IC50 by PTEN_mut
W = 72, p-value = 0.9354
alternative hypothesis: true location shift is not equal to 0

> wilcox.test(LN_IC50 ~ MGMT_mut, data = gbm_temo)

Wilcoxon rank sum exact test

data:  LN_IC50 by MGMT_mut
W = 79, p-value = 0.6141
alternative hypothesis: true location shift is not equal to 0

> model <- aov(LN_IC50 ~ PTEN_mut * MGMT_mut, data = gbm_temo)
> summary(model)
Df Sum Sq Mean Sq F value Pr(>F)
PTEN_mut     1  0.321  0.3209   0.264  0.612
MGMT_mut     1  0.366  0.3657   0.301  0.589
Residuals   24 29.192  1.2163               
> shapiro.test(gbm_temo$LN_IC50)

Shapiro-Wilk normality test

data:  gbm_temo$LN_IC50
W = 0.95788, p-value = 0.3303

> model <- aov(LN_IC50 ~ PTEN_mut * MGMT_mut, data = gbm_temo)
> shapiro.test(residuals(model))

Shapiro-Wilk normality test

data:  residuals(model)
W = 0.96923, p-value = 0.5816

> table(gbm_temo$PTEN_mut, gbm_temo$MGMT_mut)

FALSE TRUE
FALSE     0    7
TRUE     15    5
> 
  > t.test(LN_IC50 ~ PTEN_mut, data = gbm_temo)

Welch Two Sample t-test

data:  LN_IC50 by PTEN_mut
t = 0.38189, df = 7.0993, p-value = 0.7137
alternative hypothesis: true difference in means between group FALSE and group TRUE is not equal to 0
95 percent confidence interval:
  -1.287219  1.784755
sample estimates:
  mean in group FALSE  mean in group TRUE 
6.628471            6.379703 

> 
  > t.test(LN_IC50 ~ MGMT_mut, data = gbm_temo)

Welch Two Sample t-test

data:  LN_IC50 by MGMT_mut
t = -0.72487, df = 16.984, p-value = 0.4784
alternative hypothesis: true difference in means between group FALSE and group TRUE is not equal to 0
95 percent confidence interval:
  -1.2544562  0.6129272
sample estimates:
  mean in group FALSE  mean in group TRUE 
6.301637            6.622401 

> 
  > summary(aov(LN_IC50 ~ PTEN_mut * MGMT_mut, data = gbm_temo))
Df Sum Sq Mean Sq F value Pr(>F)
PTEN_mut     1  0.321  0.3209   0.264  0.612
MGMT_mut     1  0.366  0.3657   0.301  0.589
Residuals   24 29.192  1.2163               
> boxplot(LN_IC50 ~ group,
          +         data = gbm_temo,
          +         main = "Temozolomide response by mutation group",
          +         xlab = "Mutation group",
          +         ylab = "LN_IC50")
> stripchart(LN_IC50 ~ group,
             +            data = gbm_temo,
             +            vertical = TRUE,
             +            method = "jitter",
             +            pch = 19,
             +            add = TRUE)