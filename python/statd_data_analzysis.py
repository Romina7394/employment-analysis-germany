
import pandas as pd
import matplotlib
# load data 
df = pd.read_csv(
    r"C:\Users\romin\OneDrive\Desktop\SQL\stadtdata.csv",
    sep=";",
    encoding="utf-8-sig"
)

# clean
df["city"] = df["city"].astype(str).str.strip()
df["Total"] = pd.to_numeric(df["Total"], errors="coerce")

df = df[df["Total"].notna()]

df = df[~df["city"].str.contains("kreis|bayern|region|franken|Arnsberg|Ems|Detmold|Schwaben|Pfalz|Landeshauptstadt", case=False, na=False)]

# sort
df = df.sort_values(by=["Total", "city"], ascending=[False, True])

# cumulative
df["cumulative_sum"] = df["Total"].cumsum()
df["cumulative_percentage"] = (100 * df["cumulative_sum"] / df["Total"].sum()).round(2)

# output
print(df.head(10))
df.head(10).to_csv(r"C:\Users\romin\OneDrive\Desktop\SQL\output.csv",sep=";", index=False)

# Visualization
import matplotlib.pyplot as plt

plt.figure()
plt.plot(df["cumulative_percentage"].values)

plt.xlabel("Cities (sorted)")
plt.ylabel("Cumulative %")
plt.title("Pareto Analysis of Employment by City")

plt.savefig(r"C:\Users\romin\OneDrive\Desktop\SQL\pareto.png", dpi=300, bbox_inches="tight")
plt.close()
plt.figure()

plt.bar(df["city"].head(10), df["Total"].head(10))
plt.xticks(rotation=45)

plt.title("Top 10 Cities by Employment")

plt.savefig(r"C:\Users\romin\OneDrive\Desktop\SQL\top10_chart.png", dpi=300, bbox_inches="tight")
plt.close()