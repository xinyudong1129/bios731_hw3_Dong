library(here)
library(dplyr)

save_simulation <- function(dat, params){
  
  sim_dir <- here("data", "simulations")
  
  if(!dir.exists(sim_dir)){
    dir.create(sim_dir, recursive = TRUE)
  }
  
  # Create unique data set names
  timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
  
  dataset_name <- paste0(
    "logistic_sim_n", params$n,
    "_b0_", params$beta0,
    "_b1_", params$beta1,
    "_seed_", params$seed,
    "_", timestamp
  )
  
  file_path <- here(
    "data",
    "simulations",
    paste0(dataset_name, ".rds")
  )
  
  saveRDS(dat, file_path)
  
  # ---- Metadata logging ----
  
  metadata_file <- here("data", "simulation_metadata.csv")
  
  new_row <- data.frame(
    dataset = dataset_name,
    file = file_path,
    n = params$n,
    beta0 = params$beta0,
    beta1 = params$beta1,
    seed = params$seed,
    timestamp = timestamp
  )
  
  if(file.exists(metadata_file)){
    
    metadata <- read.csv(metadata_file)
    
    metadata <- bind_rows(metadata, new_row)
    
  } else {
    
    metadata <- new_row
    
  }
  
  write.csv(metadata, metadata_file, row.names = FALSE)
  
  return(file_path)
}