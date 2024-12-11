# visualise a version of tidy data (python style)
#
# ds 2024-12-11

# %%
import pandas as pd
import janitor
import seaborn as sns

#  %%

fname = "diabetes_012_health_indicators_BRFSS2015.csv"
d = pd.read_csv(fname).clean_names()

# %%  plot distribution of bmi

s = sns.histplot(data = d, x='bmi', 
             hue='sex', binwidth=3)
fig = s.get_figure()
fig.savefig("sns-simple-hist.png")
# %% and facetting

g = sns.FacetGrid(d, col="sex")
g.map_dataframe(sns.histplot, x="bmi",binwidth=3)

# here we don't need to get_figure()
g.savefig("sns-facet-hist.png")

# %%
