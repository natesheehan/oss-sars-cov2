# Regression between two databases ----------------------------------------
gis_main_df_europe = main_df |>
  filter(wy < "22/38") |>
  group_by(wy,Sub.region.Name) |>
  summarise(sum_gisaid = sum(GISAID.weekly.submissions)) |>
  mutate(percentage_gis = sum_gisaid / sum(sum_gisaid))

c19_main_df_europe = main_df |>
  filter(wy < "22/38") |>
  group_by(wy,Sub.region.Name) |>
  summarise(sum_cd19dp = sum(C19DP.weekly.submissions)) |>
  mutate(percentage_c19 = sum_cd19dp / sum(sum_cd19dp))

sum_gis_c19 = right_join(gis_main_df_europe,c19_main_df_europe)
sum_gis_c19$t = as.numeric(stringr::str_remove(sum_gis_c19$wy, "/"))
sum_gis_c19$f = factor(sum_gis_c19$Sub.region.Name,      # Reordering group factor levels
                       levels = paste(unique(sum_gis_c19$Sub.region.Name)))

ggplot(sum_gis_c19, aes(x=wy, y=sum_gisaid, fill=Sub.region.Name)) +
  geom_area()

regions = as.data.frame(unique(sum_gis_c19$Sub.region.Name))
colnames(regions) = "region"

ggscatter(
  main_df,
  x = "GISAID.weekly.submissions",
  y = "new_cases",
  add = "reg.line",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID.weekly.submissions",
  ylab = "stringency_index",
  title = "Global"
)
p1 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Latin America and the Caribbean") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p2 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Northern America") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p3 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "South-eastern Asia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)

p4 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Eastern Asia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p5 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Central Asia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p6 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Western Asia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)

p7 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Southern Asia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p8 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Northern Europe") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)

p9 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Southern Europe") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p10 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Western Europe") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p11 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Eastern Europe") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p12 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Australia and New Zealand") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p13 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Micronesia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p14 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Polynesia") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p15 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Northern Africa") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)
p16 = ggscatter(
  sum_gis_c19 %>%
    filter(Sub.region.Name == "Sub-Saharan Africa") %>%
    mutate(
      sum_gisaid = log(sum_gisaid),
      sum_cd19dp = log(sum_cd19dp)
    ),
  x = "sum_gisaid",
  y = "sum_cd19dp",
  add = "reg.line",
  facet.by = "Sub.region.Name",
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.method = "pearson",
  xlab = "GISAID",
  ylab = "ENA"
)



ggarrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p15,p16,p0,nrow = 4,ncol = 4) |>
  annotate_figure(bottom = text_grob("Pearson correlation coefficient",
                                     color = "black", face = "bold", size = 16)) + theme_landscape()

ggsave(
  paste0("plots/submission-correlation.png"),
  dpi = 320,
  width = 24,
  height = 16,
  limitsize = FALSE
# )
#
# # Shapiro-Wilk normality test
# #
# # data:  temporal_sub_all$sum_gisaid
# # W = 0.74337, p-value = 0.00000000000001837
# # Shapiro-Wilk normality test for wt
# shapiro.test(temporal_sub_all$sum_cd19dp) # => p = 0.09
# # Shapiro-Wilk normality test
# #
# # data:  temporal_sub_all$sum_cd19dp
# # W = 0.83316, p-value = 0.00000000002076
#
# # mpg
# ggqqplot(temporal_sub_all$sum_gisaid, ylab = "sum_cd19dp")
# # wt
# z
# res <- cor.test(sum_gis_c19$sum_gisaid, sum_gis_c19$sum_cd19dp,
#                 method = "pearson")
# res
#
# b = ggscatter(temporal_sub_all_av %>% mutate(av_gisaid = log(av_gisaid), av_cd19dp = log(av_cd19dp)), x = "av_gisaid", y = "av_cd19dp",
#               add = "reg.line", conf.int = TRUE,
#               cor.coef = TRUE, cor.method = "pearson",
#               xlab = "Mean Weekly Sumbmissions to the Gisaid database", ylab = " Mean ENA")
#
#
# rm(gisaid, embl)
