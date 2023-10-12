pacman::p_load(tidyverse, ggplot2, ggwaffle, patchwork)

ris <- tibble(school = c(rep("BEES", 11), 
                  rep("BABS", 2), 
                  rep("MathsStats", 7), 
                  rep("Physics", 2),
                  rep("Psychology", 3)), 
       ci = c("Abramowitz",
              "Laffan",
              rep("Lyons", 2),
              rep("Cornwell", 2),
              rep("Falster", 3) ,
              "Kar",
              "Nakagawa",
              rep("Vafaee", 2),
              rep("Lafaye de Micheaux", 4),
              rep("Warton", 2),
              "Sisson",
              rep("Foster", 2),
              "Williams",
              "Lee",
              "Richmond"),
       project_name = c("ShinyME",
                        "biodiverseR",
                        "rgee", "Shinybushfire",
                        "litterfitter", "infinitylists",
                        "APCalign", "rmot", "bmsma",
                        NA,
                        "ShinyDB",
                        "psdR", "COVID-CDR",
                        "AnalyzeFMRI", "IndependenceTests", "PoweR", "CompQuadForm",
                        "ecoCopula", "gllvm",
                        "Automated analyses",
                        "rASDF", "magpi",
                        "Psychology eRsearch webpage",
                        "AugGaussian",
                        "Psychology eRsearch webpage"),
       project_type = c("shiny", 
                        "package", 
                        "package", "shiny",
                        "package", "package/shiny",
                        "package/shiny", "package", "package",
                        NA, 
                        "shiny",
                        rep("shiny", 2),
                        rep("package", 4), 
                        rep("package", 2),
                        "other",
                        rep("shiny", 2),
                        "other", 
                        "package",
                        "other")
)


# Summarise by School
school <- ris |> 
  waffle_iron(aes_d(group = school)) |> 
  ggplot(aes(x, y, fill = group)) + 
  geom_waffle() + 
  coord_equal() + 
  scale_fill_waffle() + 
  guides(fill=guide_legend(title = "Schools in Faculty of Science")) +
  theme_waffle() +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(), 
        legend.position = "left")

# Summarise by Project type
type <- ris |> 
  waffle_iron(aes_d(group = project_type)) |> 
  ggplot(aes(x, y, fill = group)) + 
  geom_waffle() + 
  coord_equal() + 
  scale_fill_waffle() + 
  guides(fill=guide_legend(title = "R software type")) +
  theme_waffle() +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "right")


school + type
