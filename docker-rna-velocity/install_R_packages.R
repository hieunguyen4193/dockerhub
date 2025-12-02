if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")

new.pkgs <- c(  "tidyverse", 
                "argparse", 
                "shinyjs", 
                "shinyalert", 
                "DT", 
                "dplyr", 
                "pillar", 
                "this.path", 
                "readxl", 
                "writexl",
                "remotes")
for (pkg in new.pkgs){
  if (pkg %in% installed.packages() == FALSE){
    install.packages(pkg)
  }
}

new.bioc.pkgs <- c( "Seurat",
                    "pathview", 
                    "GOSemSim", 
                    "DOSE", 
                    "clusterProfiler",  
                    "org.Hs.eg.db", 
                    "org.Mm.eg.db", 
                    "scRepertoire",
                    "biomaRt", 
                    "msigdbr", 
                    "glmGamPoi", 
                    "monocle")
for (pkg in new.bioc.pkgs){
  if (pkg %in% installed.packages() == FALSE){
    BiocManager::install(pkg, update = FALSE)
  }
}

if ("DoubletFinder" %in% installed.packages() == FALSE){
  remotes::install_github('chris-mcginnis-ucsf/DoubletFinder', force = TRUE)
}

# install monocle3
devtools::install_github('cole-trapnell-lab/monocle3')
