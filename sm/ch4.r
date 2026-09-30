# ============================================================
# 📘 CHAPTER 4 — DATA FILTERING AND CLEANING
# 📚 Topics: 4.1 to 4.5
# 💻 Complete R Code Sheet
# ============================================================


# ============================================================
# 🔹 4.1 SUBSETTING AND FILTERING DATA
# ============================================================

# 📌 Data Cleaning:
# Data cleaning transforms raw data into consistent data
# that can be easily analyzed.
#
# 📌 Filtering Data:
# Filtering means extracting only the part of data
# that satisfies a given condition.
#
# It is similar to SQL WHERE or Excel Filter.
#
# 📌 dplyr package is used for filtering rows.


# ------------------------------------------------------------
# 📌 Create Sample Student Data
# ------------------------------------------------------------

library(dplyr)

student <- data.frame(
  Name = c("Ram", "Jay", "Raj", "Amit", "Priya"),
  Age = c(19, 20, 18, 21, 19),
  Marks = c(85, 72, 90, 65, 88)
)

student

# 📤 Output:
#    Name Age Marks
# 1   Ram  19    85
# 2   Jay  20    72
# 3   Raj  18    90
# 4  Amit  21    65
# 5 Priya  19    88


# ------------------------------------------------------------
# 1️⃣ filter() — Single Condition
# ------------------------------------------------------------

# 📌 filter() selects rows according to a condition.

filter(student, Marks > 80)

# 📤 Output:
#    Name Age Marks
# 1   Ram  19    85
# 2   Raj  18    90
# 3 Priya  19    88


# ------------------------------------------------------------
# 2️⃣ filter() — Multiple Conditions
# ------------------------------------------------------------

# 📌 & means AND.
# Both conditions must be TRUE.

filter(student, Age >= 19 & Marks > 80)

# 📤 Output:
#    Name Age Marks
# 1   Ram  19    85
# 2 Priya  19    88


# ------------------------------------------------------------
# 📌 OR Condition
# ------------------------------------------------------------

# 📌 | means OR.
# At least one condition must be TRUE.

filter(student, Age == 18 | Marks > 85)

# 📤 Output:
#    Name Age Marks
# 1   Raj  18    90
# 2 Priya  19    88


# ------------------------------------------------------------
# 3️⃣ slice_head() — Top Rows
# ------------------------------------------------------------

# 📌 slice_head() selects the first n rows.

student %>% slice_head(n = 3)

# 📤 Output:
#    Name Age Marks
# 1   Ram  19    85
# 2   Jay  20    72
# 3   Raj  18    90


# ------------------------------------------------------------
# 4️⃣ slice_tail() — Last Rows
# ------------------------------------------------------------

# 📌 slice_tail() selects the last n rows.

student %>% slice_tail(n = 2)

# 📤 Output:
#    Name Age Marks
# 4  Amit  21    65
# 5 Priya  19    88


# ------------------------------------------------------------
# 5️⃣ top_n() — Top Values
# ------------------------------------------------------------

# 📌 top_n() selects rows with the top n values.

top_n(student, 3, Marks)

# 📤 Output:
#    Name Age Marks
# 1   Ram  19    85
# 2   Raj  18    90
# 3 Priya  19    88


# ------------------------------------------------------------
# 6️⃣ slice_sample() — Random Rows
# ------------------------------------------------------------

# 📌 slice_sample() selects random rows.

set.seed(1)

student %>% slice_sample(n = 2)

# 📤 Output:
# Random output may vary depending on R version.


# ------------------------------------------------------------
# 7️⃣ slice_max() — Maximum Values
# ------------------------------------------------------------

# 📌 slice_max() selects rows having the highest values.

student %>% slice_max(order_by = Marks, n = 3)

# 📤 Output:
#    Name Age Marks
# 1   Raj  18    90
# 2 Priya  19    88
# 3   Ram  19    85


# ------------------------------------------------------------
# 8️⃣ slice_min() — Minimum Values
# ------------------------------------------------------------

# 📌 slice_min() selects rows having the lowest values.

student %>% slice_min(order_by = Marks, n = 2)

# 📤 Output:
#   Name Age Marks
# 1 Amit  21    65
# 2  Jay  20    72


# 🧠 QUICK MEMORY:
# filter()       → condition
# slice_head()   → first rows
# slice_tail()   → last rows
# top_n()        → top values
# slice_sample() → random rows
# slice_max()    → maximum values
# slice_min()    → minimum values



# ============================================================
# 🔹 4.2 ADDING, REMOVING AND RENAMING VARIABLES
# ============================================================

# 📌 Variables are columns/attributes in a data frame.


# ------------------------------------------------------------
# 1️⃣ Adding a Variable
# ------------------------------------------------------------

# 📌 A new variable can be added using $.

df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35)
)

df$Salary <- c(50000, 60000, 70000)

df

# 📤 Output:
#      Name Age Salary
# 1   Alice  25  50000
# 2     Bob  30  60000
# 3 Charlie  35  70000


# ------------------------------------------------------------
# 2️⃣ Removing a Variable
# ------------------------------------------------------------

# 📌 A variable can be removed by assigning NULL.

df$Age <- NULL

df

# 📤 Output:
#      Name Salary
# 1   Alice  50000
# 2     Bob  60000
# 3 Charlie  70000


# ------------------------------------------------------------
# 3️⃣ Renaming a Variable
# ------------------------------------------------------------

# 📌 rename() changes the name of a variable.

df <- rename(df, Income = Salary)

df

# 📤 Output:
#      Name Income
# 1   Alice  50000
# 2     Bob  60000
# 3 Charlie  70000


# 🧠 QUICK MEMORY:
# Add    → $
# Remove → NULL
# Rename → rename()



# ============================================================
# 🔹 4.3 DATA CLEANING AND TRANSFORMATION
# ============================================================

# 📌 Data Cleaning:
# Data cleaning removes data that does not belong.
#
# 📌 Data Transformation:
# Data transformation converts data from one format
# or structure into another.
#
# 📌 Data Wrangling / Munging:
# It means transforming and mapping raw data into another
# format for storing, analyzing or processing.
#
# 📌 Data cleaning prepares raw data for analysis
# and model building.
#
# Common tasks:
# 1. Remove rows with missing values
# 2. Replace missing values
# 3. Remove duplicate rows


# ------------------------------------------------------------
# 📌 Sample Data Frame
# ------------------------------------------------------------

df <- data.frame(
  team = c("A","A","B","C","D","E","F","G","H","I"),
  points = c(4,4,NA,8,6,12,14,86,13,8),
  rebounds = c(9,9,7,6,8,NA,9,14,12,11),
  assists = c(2,2,NA,7,6,6,9,10,NA,14)
)

df

# 📤 Output:
#    team points rebounds assists
# 1     A      4        9       2
# 2     A      4        9       2
# 3     B     NA        7      NA
# 4     C      8        6       7
# 5     D      6        8       6
# 6     E     12       NA       6
# 7     F     14        9       9
# 8     G     86       14      10
# 9     H     13        12      NA
# 10    I      8        11      14


# ------------------------------------------------------------
# 1️⃣ Remove Rows with Missing Values — drop_na()
# ------------------------------------------------------------

# 📌 drop_na() removes rows containing missing values.

library(tidyr)

new_df <- df %>% drop_na()

new_df

# 📤 Output:
#    team points rebounds assists
# 1     A      4        9       2
# 2     A      4        9       2
# 3     C      8        6       7
# 4     D      6        8       6
# 5     F     14        9       9
# 6     G     86       14      10
# 7     I      8        11      14


# ------------------------------------------------------------
# 2️⃣ Replace Missing Values
# ------------------------------------------------------------

# 📌 Missing numeric values can be replaced by
# mean or median values.

new_df <- df %>%
  mutate(
    across(
      where(is.numeric),
      ~replace(., is.na(.), median(., na.rm = TRUE))
    )
  )

new_df

# 📤 Output:
# Missing numeric values are replaced by their
# respective column median values.


# ------------------------------------------------------------
# 3️⃣ Remove Duplicate Rows — distinct()
# ------------------------------------------------------------

# 📌 distinct() removes duplicate rows.

new_df <- df %>% distinct()

new_df

# 📤 Output:
# Duplicate row is removed.



# 🧠 QUICK MEMORY:
# drop_na()  → remove missing rows
# replace()  → replace missing values
# distinct() → remove duplicates



# ============================================================
# 🔹 4.4 IDENTIFYING AND HANDLING MISSING VALUES
# ============================================================

# 📌 Missing values are values that are not known.
#
# R uses NA and NaN to represent missing/special values.
#
# 📌 is.na() returns TRUE when value is NA/NaN
# and FALSE when value is not missing.


# ------------------------------------------------------------
# 1️⃣ is.na()
# ------------------------------------------------------------

x <- c(10, 20, NA, 40, NA)

is.na(x)

# 📤 Output:
# [1] FALSE FALSE TRUE FALSE TRUE


# ------------------------------------------------------------
# 2️⃣ Extract Non-Missing Values
# ------------------------------------------------------------

x <- x[!is.na(x)]

x

# 📤 Output:
# [1] 10 20 40


# ------------------------------------------------------------
# 3️⃣ na.omit()
# ------------------------------------------------------------

# 📌 na.omit() removes rows containing NA.

df <- data.frame(
  Name = c("Ram", "Jay", "Raj", "Amit"),
  Age = c(19, NA, 20, 21),
  Marks = c(85, 78, NA, 90)
)

new_df <- na.omit(df)

new_df

# 📤 Output:
#   Name Age Marks
# 1  Ram  19    85
# 4 Amit  21    90


# ------------------------------------------------------------
# 4️⃣ is.na() on Data Frame
# ------------------------------------------------------------

is.na(df)

# 📤 Output:
#        Name   Age Marks
# [1,] FALSE FALSE FALSE
# [2,] FALSE  TRUE FALSE
# [3,] FALSE FALSE  TRUE
# [4,] FALSE FALSE FALSE


# ------------------------------------------------------------
# 5️⃣ Count Total Missing Values
# ------------------------------------------------------------

sum(is.na(df))

# 📤 Output:
# [1] 2


# ------------------------------------------------------------
# 6️⃣ Count Missing Values Column-wise
# ------------------------------------------------------------

colSums(is.na(df))

# 📤 Output:
#   Name    Age  Marks
#      0      1      1


# ------------------------------------------------------------
# 7️⃣ Visualize Missing Values
# ------------------------------------------------------------

image(is.na(df))

# 📤 Output:
# A graphical representation of TRUE/FALSE
# missing-value positions is displayed.


# ------------------------------------------------------------
# 8️⃣ na.fail()
# ------------------------------------------------------------

# 📌 na.fail() stops the operation if missing values exist.

# na.fail(df)

# 📤 Output:
# Error because df contains NA values.


# ------------------------------------------------------------
# 9️⃣ na.exclude()
# ------------------------------------------------------------

# 📌 na.exclude() excludes rows containing NA
# and keeps information about original positions.

na.exclude(df)

# 📤 Output:
# Rows containing NA are excluded.


# ------------------------------------------------------------
# 🔟 na.pass()
# ------------------------------------------------------------

# 📌 na.pass() passes the data without removing NA.

na.pass(df)

# 📤 Output:
# Data is returned with NA values.


# 🧠 QUICK MEMORY:
# is.na()       → find missing values
# sum(is.na())  → count missing values
# colSums()     → count missing values column-wise
# na.omit()     → remove rows with NA
# na.fail()     → stop if NA exists
# na.exclude()  → exclude NA + keep position
# na.pass()     → pass NA values



# ============================================================
# 🔹 4.5 DATA TYPE CONVERSION AND RECODING VARIABLES
# ============================================================

# 📌 Data Type Conversion:
# Converting one type of data into another type.
#
# 📌 R is a dynamically typed / weakly typed language.
# R automatically creates data types based on assigned values.
#
# Common types:
# Numeric / Double
# Character
# Logical


# ------------------------------------------------------------
# 1️⃣ Type Checking
# ------------------------------------------------------------

name <- "GeeksforGeeks"
age <- 20
pwd <- FALSE

typeof(name)
typeof(age)
typeof(pwd)

# 📤 Output:
# [1] "character"
# [1] "double"
# [1] "logical"


# ------------------------------------------------------------
# 2️⃣ Numeric / Character → Logical
# ------------------------------------------------------------

# 📌 Non-zero numeric value → TRUE
# 📌 Character "FALSE" → FALSE

age <- 20
pwd <- "FALSE"

as.logical(age)
as.logical(pwd)

# 📤 Output:
# [1] TRUE
# [1] FALSE


# ------------------------------------------------------------
# 3️⃣ Numeric / Logical → Character
# ------------------------------------------------------------

age <- 20
pwd <- FALSE

as.character(age)
as.character(pwd)

# 📤 Output:
# [1] "20"
# [1] "FALSE"


# ------------------------------------------------------------
# 4️⃣ Character / Logical → Numeric
# ------------------------------------------------------------

x <- "20"
y <- FALSE
z <- TRUE

as.numeric(x)
as.numeric(y)
as.numeric(z)

# 📤 Output:
# [1] 20
# [1] 0
# [1] 1


# ------------------------------------------------------------
# 5️⃣ Vectors → Matrix using rbind()
# ------------------------------------------------------------

# 📌 rbind() arranges vectors row-wise.
# 📌 Row Major Order.

vector1 <- c("red", "green", "blue", "yellow")
vector2 <- c(1, 2, 3, 4)

print("Row Major Order")

rbind(vector1, vector2)

# 📤 Output:
#         [,1]    [,2]    [,3]    [,4]
# vector1 "red"   "green" "blue"  "yellow"
# vector2 "1"     "2"     "3"     "4"


# ------------------------------------------------------------
# 6️⃣ Vectors → Matrix using cbind()
# ------------------------------------------------------------

# 📌 cbind() arranges vectors column-wise.
# 📌 Column Major Order.

print("Column Major Order")

cbind(vector1, vector2)

# 📤 Output:
#         vector1 vector2
# [1,]    "red"   "1"
# [2,]    "green" "2"
# [3,]    "blue"  "3"
# [4,]    "yellow" "4"


# ------------------------------------------------------------
# 7️⃣ Vectors → Data Frame
# ------------------------------------------------------------

# 📌 data.frame() converts vectors into a data frame.
# 📌 First vector → 1st column.
# 📌 Second vector → 2nd column.

vector1 <- c("Ram", "Jay", "Raj")
vector2 <- c(19, 20, 18)

data.frame(vector1, vector2)

# 📤 Output:
#   vector1 vector2
# 1     Ram      19
# 2     Jay      20
# 3     Raj      18


# ------------------------------------------------------------
# 8️⃣ Matrix → Vector
# ------------------------------------------------------------

# 📌 as.vector() converts matrix into one long vector.
# 📌 Elements are accessed in column-major order.

m <- matrix(1:6, nrow = 2)

m
as.vector(m)

# 📤 Output:
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
#
# [1] 1 2 3 4 5 6


# ------------------------------------------------------------
# 9️⃣ Matrix → Data Frame
# ------------------------------------------------------------

# 📌 as.data.frame() converts matrix into data frame.

as.data.frame(m)

# 📤 Output:
#   V1 V2 V3
# 1  1  3  5
# 2  2  4  6


# ------------------------------------------------------------
# 🔟 Data Frame → Matrix
# ------------------------------------------------------------

# 📌 as.matrix() converts data frame into matrix.
# 📌 Mixed data types can result in character matrix.

df2 <- data.frame(
  Name = c("Ram", "Jay"),
  Age = c(19, 20)
)

as.matrix(df2)

# 📤 Output:
#      Name  Age
# [1,] "Ram" "19"
# [2,] "Jay" "20"



# ============================================================
# 🔄 RECODING VARIABLES
# ============================================================

# 📌 Recoding means modifying values of a variable/column.
#
# It is used to:
# 📂 Group categories
# 🔄 Change data types
# 📊 Prepare data for analysis


# ------------------------------------------------------------
# 1️⃣ ifelse() — Conditional Recoding
# ------------------------------------------------------------

# 📌 Best for simple conditional recoding.

age <- c(10, 20, 70, 15, 45)

age_group <- ifelse(
  age < 18,
  "Child",
  ifelse(age <= 65, "Adult", "Senior")
)

age_group

# 📤 Output:
# [1] "Child"  "Adult"  "Senior" "Child"  "Adult"


# ------------------------------------------------------------
# 2️⃣ dplyr::recode() — Direct Value Replacement
# ------------------------------------------------------------

# 📌 Used to recode specific categorical values.

library(dplyr)

gender <- c("M", "F", "M", "F")

gender_new <- recode(
  gender,
  "M" = "Male",
  "F" = "Female"
)

gender_new

# 📤 Output:
# [1] "Male"   "Female" "Male"   "Female"


# ------------------------------------------------------------
# 3️⃣ cut() — Recoding Continuous Variables
# ------------------------------------------------------------

# 📌 cut() divides continuous numeric data into groups/bins.

income <- c(20000, 45000, 65000, 80000, 100000)

income_level <- cut(
  income,
  breaks = c(0, 30000, 70000, Inf),
  labels = c("Low", "Medium", "High")
)

income_level

# 📤 Output:
# [1] Low    Medium Medium High   High
# Levels: Low Medium High


# ------------------------------------------------------------
# 4️⃣ replace() — Specific Value Replacement
# ------------------------------------------------------------

# 📌 replace() changes specific values.
# 📌 It can also replace NA values.

x <- c(10, NA, 20, NA, 30)

x <- replace(x, is.na(x), 0)

x

# 📤 Output:
# [1] 10 0 20 0 30


# ------------------------------------------------------------
# 5️⃣ factor() — Recoding Factor Levels
# ------------------------------------------------------------

# 📌 factor() handles categorical data.
# 📌 It can recode and reorder factor levels.

survey <- factor(
  c("Agree", "Neutral", "Disagree"),
  levels = c("Disagree", "Neutral", "Agree")
)

survey

# 📤 Output:
# [1] Agree    Neutral  Disagree
# Levels: Disagree Neutral Agree


# ============================================================
# 🧠 ⭐ FINAL CHAPTER 4 QUICK REVISION
# ============================================================

# 🔹 4.1 FILTERING
# filter()       → condition
# slice_head()   → first rows
# slice_tail()   → last rows
# top_n()        → top values
# slice_sample() → random rows
# slice_max()    → maximum values
# slice_min()    → minimum values
#
# 🔹 4.2 VARIABLES
# $              → add variable
# NULL           → remove variable
# rename()       → rename variable
#
# 🔹 4.3 DATA CLEANING
# drop_na()      → remove missing rows
# replace()      → replace missing values
# distinct()     → remove duplicate rows
#
# 🔹 4.4 MISSING VALUES
# is.na()        → find missing values
# sum(is.na())   → count missing values
# colSums()      → column-wise count
# na.omit()      → remove NA rows
# na.fail()      → stop when NA exists
# na.exclude()   → exclude NA + keep position
# na.pass()      → pass NA
#
# 🔹 4.5 DATA TYPE CONVERSION
# as.logical()   → Logical
# as.character() → Character
# as.numeric()   → Numeric
# rbind()        → vectors → rows
# cbind()        → vectors → columns
# data.frame()   → vectors → data frame
# as.vector()    → matrix → vector
# as.data.frame()→ matrix → data frame
# as.matrix()    → data frame → matrix
#
# 🔄 RECODING
# ifelse()       → condition
# recode()       → change specific values
# cut()          → make groups/bins
# replace()      → replace values
# factor()       → categorical levels
#
# ============================================================
# 🎯 CHAPTER 4 COMPLETE
# ============================================================
