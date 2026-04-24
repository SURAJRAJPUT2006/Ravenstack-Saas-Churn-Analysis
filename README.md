# Ravenstack-Saas-Churn-Analysis
## Data Methodology

**This project uses synthetically generated data designed to reflect 
realistic B2B SaaS patterns.**

**Why synthetic data?**

1. **Control & Realism:** Publicly available SaaS datasets often lack 
   the granularity needed for advanced analysis (MRR movements, 
   feature-level usage, expansion tracking). Generating data allowed 
   me to model realistic business scenarios while including all 
   necessary dimensions.

2. **Industry Benchmarks:** Data generation was based on research from:
   - OpenView SaaS Benchmarks Report (2024)
   - ChartMogul SaaS Metrics Standards
   - Pacific Crest SaaS Survey
   - ProfitWell Churn Research

3. **Statistical Validity:** Generated 2,000 accounts to ensure 
   statistically significant sample sizes for cohort analysis 
   (minimum 50 accounts per monthly cohort).

**Data Generation Methodology:** Python, SQL

**Validation:** All patterns validated against industry benchmarks 
(e.g., Enterprise churn: 5-7% annual, SMB churn: 10-15% annual).
