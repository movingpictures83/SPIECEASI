# SPEICEASI
# Language: R
# Input: CSV (abundance matrix)
# Output: CSV (relationships)
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: SpiecEasi_1.0.7

PluMA plugin that runs the SPIEC-EASI (Kurtz et al. 2015) method to infer
ecological relationships.

The plugin accepts as input a CSV file where rows represent samples and columns
represent community members, and entry (i, j) represents the abundance of member j
in sample i.

The plugin produces an output of ecological relationships, as another CSV file.
Both rows and columns represent members, and entry (i, j) is the relationship between
member i and member j (mutual relationships only, no directed edges).
