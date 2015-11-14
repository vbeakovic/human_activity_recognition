## run_analysis.R
## Step 1 ##
# Read in activities
activity_labels <- read.table("./uci_har_dataset/activity_labels.txt", 
                              stringsAsFactors = FALSE, colClasses = c("NULL", "character"))
# Extract a character vector with activities
activity_labels <- as.vector(activity_labels$V2)



# 3. A code book that describes the variables the data and any transformations or work that you performed
# to clean up the data called CodeBook.md
# 4. A README.md file describes how the scripts work




proba <- read.table("./uci_har_dataset/train/X_train.txt")

