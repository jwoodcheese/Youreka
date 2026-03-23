library(dplyr)
library(tidyr)

# Load data
drug <- read.csv("C:/Users/dylan/Downloads/GDSC2_fitted_dose_response_27Oct23.csv")
mutations <- read.csv("C:/Users/dylan/Downloads/mutations_all_20260316.csv")

# Build MAPK mutation list
mapk_models <- mutations %>%
  filter(gene_symbol %in% c("KRAS", "BRAF")) %>%
  distinct(model_id) %>%
  mutate(MAPK_flag = "MAPK")

# Get all cell lines in drug data
cellline_list <- drug %>%
  distinct(SANGER_MODEL_ID)

# Label cell lines as MAPK or Non-MAPK
cellline_labels <- cellline_list %>%
  left_join(mapk_models, by = c("SANGER_MODEL_ID" = "model_id")) %>%
  mutate(MAPK_status = ifelse(is.na(MAPK_flag), "Non-MAPK", "MAPK"))

# Attach labels to drug data
drug_labeled <- drug %>%
  left_join(cellline_labels, by = "SANGER_MODEL_ID")

# Count cases per drug
drug_group_counts <- drug_labeled %>%
  group_by(DRUG_NAME, MAPK_status) %>%
  summarise(n = n(), .groups = "drop") %>%
  pivot_wider(names_from = MAPK_status, values_from = n, values_fill = 0) %>%
  mutate(total_cases = MAPK + `Non-MAPK`) %>%
  arrange(desc(total_cases))

# Choose Ulixertinib
chosen_drug <- drug_labeled %>%
  filter(DRUG_NAME == "Ulixertinib")

# Check sample size
nrow(chosen_drug)
table(chosen_drug$MAPK_status)

# Boxplot
boxplot(LN_IC50 ~ MAPK_status,
        data = chosen_drug,
        main = "Ulixertinib response by MAPK status",
        xlab = "MAPK group",
        ylab = "LN_IC50")

# Main statistical tests
wilcox.test(LN_IC50 ~ MAPK_status, data = chosen_drug)
t.test(LN_IC50 ~ MAPK_status, data = chosen_drug)

# Summary statistics
aggregate(LN_IC50 ~ MAPK_status, data = chosen_drug, mean)
aggregate(LN_IC50 ~ MAPK_status, data = chosen_drug, median)

# Normality checks
by(chosen_drug$LN_IC50, chosen_drug$MAPK_status, shapiro.test)

# Histograms
hist(chosen_drug$LN_IC50,
     main = "Distribution of LN_IC50",
     xlab = "LN_IC50")

hist(chosen_drug$LN_IC50[chosen_drug$MAPK_status == "MAPK"],
     main = "MAPK LN_IC50",
     xlab = "LN_IC50")

hist(chosen_drug$LN_IC50[chosen_drug$MAPK_status == "Non-MAPK"],
     main = "Non-MAPK LN_IC50",
     xlab = "LN_IC50")