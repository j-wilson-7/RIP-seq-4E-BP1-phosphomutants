### RIP-seq to capture the cap-dependent translation complex of 4E-BP1 phosphomutants
### Associated venn diagrams and UpsetPlots

## Proportional venn RIP-seq phosphomutants
fit1 <- euler(c("A" = 1834, "B" = 0,
                "A&B" = 229))

col <- c("#66D2D6","#FBC740")
col <- c("#66D2D6","darkblue")
col <- c("#FBC740","orange")

plot(fit1,
     quantities = TRUE,
     #legend = list(side = "right", font=1, labels = c("DMEMlow", "DMEMhigh"), alpha=1, cex=1.2),
     labels = c("TGF-B1-dependent", "4E-BP1-dependent"),
     fills = list(fill = col, alpha=0.6),
)


#RIP-seq phosphomutants upset plot
library(UpSetR)

input <- c(
  "Increased binding with TGF-β1 at 6 hours" =385,
  "Increased binding with TGF-β1 at 24 hours" = 1215,
  "Increased binding with TGF-β1 at 6 hours&4E-BP1-dependent at 6 hours" = 3,
  "Increased binding with TGF-β1 at 6 hours&Increased binding with TGF-β1 at 24 hours" = 124,
  "Increased binding with TGF-β1 at 24 hours&4E-BP1-dependent at 24 hours" = 34,
  "Increased binding with TGF-β1 at 6 hours&4E-BP1-dependent at 6 hours&4E-BP1-dependent at 24 hours" = 0
)

upset(fromExpression(input), 
      order.by = "freq", 
      decreasing = T, 
      #mb.ratio = c(0.6, 0.4),
      #number.angles = 0, 
      text.scale = 1.5, 
      point.size = 4, 
      line.size = 1,
      mainbar.y.label = "Number of genes", sets.x.label = "Total set size"
)

