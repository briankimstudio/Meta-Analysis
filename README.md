## Tutorial on Meta-analysis in R

- Effect size.

- SMD
  - Cohen's d
  - Hedges' g
  - **metacont()**

- Oeverall
  - Fixed effect model
  - Random effect model (Generally, CI is wider than Fixed effect model)
  - Forest plot
    - **forest()**

- Heterogeneity. 
  - Cochrane Q(p<0.1)
    - H0 : Same
    - H1 : Different
  - Higgins I2
  - **metareg()**, **bubble()**

- Publication bias.
  - Funnel plot 
    - **funnel()**
  - Egger's test 
    - **metabias()**
  - Begg's test 
    - **metabias()**
