# ============================================================
# 📘 CHAPTER 3 – INTRODUCTION TO R AND WORKING WITH DATA
# 🎯 BCA SEM-3 | MDC – STATISTICAL ANALYSIS USING R
# ============================================================


# ============================================================
# 3.1 📊 OVERVIEW OF R
# ============================================================

# 🧠 THEORY:
# R is a programming language and software environment
# used for statistical analysis and graphical representation.
#
# R is widely used for:
# 📊 Data Analysis
# 📈 Data Visualization
# 📋 Statistical Modelling
# 🧹 Data Cleaning
# 🤖 Machine Learning
#
# R was created by Ross Ihaka and Robert Gentleman
# at the University of Auckland, New Zealand.
#
# R is an interpreted language.
# It supports functions, branching and looping.
#
# R is open-source and can work with other languages
# such as C, C++, Python and Java.
#
# R can also be used with big-data technologies
# such as Spark and Hadoop.


# ============================================================
# 3.2 💻 INSTALLING R AND RSTUDIO
# ============================================================

# 🧠 THEORY:
# R is the base environment used to run R programs.
#
# RStudio is an IDE (Integrated Development Environment)
# that provides a user-friendly interface for R.
#
# RStudio provides:
# ✨ Code editor
# ✨ Console
# ✨ Data management
# ✨ Graphs
# ✨ Package management
# ✨ Project management
#
# CRAN = Comprehensive R Archive Network.
# It is the main repository for R packages.
#
# Installation order:
# 1️⃣ Install R
# 2️⃣ Install RStudio
#
# No special code is required for installation.


# ============================================================
# 3.3 🧑‍💻 BASIC R SYNTAX, VARIABLES AND DATA TYPES
# ============================================================


# ------------------------------------------------------------
# 🔹 Variables and Assignment
# ------------------------------------------------------------

# 🧠 THEORY:
# A variable stores data.
# R supports:
# =   → assignment
# <-  → left assignment
# ->  → right assignment
#
# Usually <- or = is commonly used.

x = 10
print(x)

y <- 20
print(y)

30 -> z
print(z)

# 📤 OUTPUT:
# [1] 10
# [1] 20
# [1] 30


# ------------------------------------------------------------
# 🔹 Comments
# ------------------------------------------------------------

# 🧠 THEORY:
# Comments are ignored by R.
# They are used to make code easier to understand.
#
# Single-line comment starts with #

# This is a comment

x <- 10
print(x)

# 📤 OUTPUT:
# [1] 10


# ------------------------------------------------------------
# 🔹 Keywords
# ------------------------------------------------------------

# 🧠 THEORY:
# Keywords are reserved words having special meaning in R.
#
# Examples:
# if, else, repeat, while, function, for, in, next, break
#
# TRUE and FALSE are logical constants.
# NaN = Not a Number
# NULL = Undefined / no value
# Inf = Infinity


# ------------------------------------------------------------
# 🔹 Numeric Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Numeric stores numbers.
# Decimal values are numeric.
# Even a normal integer such as 5 is normally stored
# as numeric (double) in R.

x <- 3.14
print(x)
print(class(x))

y <- 5
print(y)
print(class(y))
print(is.integer(y))

# 📤 OUTPUT:
# [1] 3.14
# [1] "numeric"
# [1] 5
# [1] "numeric"
# [1] FALSE


# ------------------------------------------------------------
# 🔹 Integer Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Integer stores whole numbers.
# We can use L or as.integer().

x <- 42L
print(x)
print(class(x))

y <- as.integer(25)
print(y)
print(class(y))

# 📤 OUTPUT:
# [1] 42
# [1] "integer"
# [1] 25
# [1] "integer"


# ------------------------------------------------------------
# 🔹 Logical Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Logical values are TRUE or FALSE.

x <- 10
y <- 20

print(x < y)
print(x > y)

# 📤 OUTPUT:
# [1] TRUE
# [1] FALSE


# ------------------------------------------------------------
# 🔹 Complex Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Complex numbers contain a real part and an imaginary part.

x <- 7 + 5i
print(x)
print(class(x))

# 📤 OUTPUT:
# [1] 7+5i
# [1] "complex"


# ------------------------------------------------------------
# 🔹 Character Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Character stores text, alphabets, numbers or symbols
# inside quotes.

x <- "Hello R"
print(x)
print(class(x))

# 📤 OUTPUT:
# [1] "Hello R"
# [1] "character"


# ------------------------------------------------------------
# 🔹 Raw Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# Raw stores data as bytes.

single_raw <- as.raw(255)
print(single_raw)

# 📤 OUTPUT:
# [1] ff


# ------------------------------------------------------------
# 🔹 Find Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# class() is used to find the data type of an object.

x <- 10
print(class(x))

# 📤 OUTPUT:
# [1] "numeric"


# ------------------------------------------------------------
# 🔹 Check Data Type
# ------------------------------------------------------------

# 🧠 THEORY:
# is.numeric(), is.integer() and is.character()
# can be used to check data types.

x <- 10

print(is.numeric(x))
print(is.integer(x))
print(is.character(x))

# 📤 OUTPUT:
# [1] TRUE
# [1] FALSE
# [1] FALSE


# ------------------------------------------------------------
# 🔹 Type Conversion
# ------------------------------------------------------------

# 🧠 THEORY:
# Type conversion means changing one data type into another.
#
# Common function:
# as.integer()
# as.numeric()
# as.character()
#
# Some conversions may produce NA if conversion is not possible.

x <- "25"

y <- as.integer(x)

print(y)
print(class(y))

# 📤 OUTPUT:
# [1] 25
# [1] "integer"


# ============================================================
# 3.4 📥 IMPORTING DATA INTO R
# ============================================================

# 🧠 THEORY:
# Data is a collection of facts.
#
# Data can be available in different formats:
# 📄 TXT
# 📊 CSV
# 📗 Excel
# 🧾 JSON
# 🗂️ XML
#
# Before analysis, data must be imported into R.
#
# After importing:
# 👉 Manipulate
# 👉 Analyze
# 👉 Report


# ------------------------------------------------------------
# 🔹 Import CSV using read.csv()
# ------------------------------------------------------------

# 🧠 THEORY:
# read.csv() is used to import CSV files.

# Syntax:
# read.csv(path, header = TRUE, sep = ",")

# Example:
# data <- read.csv("student.csv", header=TRUE, sep=",")

# 📤 SAMPLE OUTPUT:
#   Name Age Marks
# 1  Ram  19    85
# 2  Jay  20    78
# 3  Raj  19    90


# ------------------------------------------------------------
# 🔹 Import using read.table()
# ------------------------------------------------------------

# 🧠 THEORY:
# read.table() can also be used to load data.
#
# header = TRUE → first row contains column names
# sep = ","     → comma is used as separator

# Example:
# data2 <- read.table(
#   "data/hotel_bookings_clean.csv",
#   sep=",",
#   header=1
# )


# ------------------------------------------------------------
# 🔹 Import Delimited File using read.delim()
# ------------------------------------------------------------

# 🧠 THEORY:
# read.delim() is used to read delimited files.
#
# By default, values are separated by TAB.
# Other separators can also be used.

# Example:
# x <- read.delim(
#   "D://Data//myfile.csv",
#   sep="|",
#   header=TRUE
# )
#
# print(x)
# typeof(x)


# ------------------------------------------------------------
# 🔹 Import JSON File
# ------------------------------------------------------------

# 🧠 THEORY:
# rjson package can be used to import JSON files.

# install.packages(
#   "rjson",
#   repos="http://cran.rstudio.com/"
# )


# ------------------------------------------------------------
# 🔹 Import XML File
# ------------------------------------------------------------

# 🧠 THEORY:
# XML package can be used to import XML files.
#
# xmlParse() is used for parsing XML files.

# Example:
# library(XML)
# data <- xmlParse("file.xml")


# ------------------------------------------------------------
# 🔹 Import TXT File
# ------------------------------------------------------------

# 🧠 THEORY:
# readLines() can read a simple text file.
#
# read.delim() can load a TXT file as a Data Frame.
#
# If there is no header row:
# header = FALSE

# Example:
# data3 <- read.delim(
#   "data/drake_lyrics.txt",
#   header=FALSE
# )
#
# head(data3, 5)


# ------------------------------------------------------------
# 🔹 Import Excel File
# ------------------------------------------------------------

# 🧠 THEORY:
# readxl package is used to import Excel files.
#
# read_excel() reads data from an Excel sheet.

# library(readxl)
#
# data4 <- read_excel(
#   "data/Tesla Deaths.xlsx",
#   sheet=1
# )
#
# head(data4, 5)


# ============================================================
# 3.5 🗃️ READ, WRITE AND VIEW DATA USING DATA FRAMES
# ============================================================

# ------------------------------------------------------------
# 🔹 Create Data Frame
# ------------------------------------------------------------

# 🧠 THEORY:
# A Data Frame displays data in table format.
#
# A Data Frame can contain different types of data
# in different columns.
#
# Each column should contain the same type of data.
#
# data.frame() is used to create a Data Frame.

student <- data.frame(
  Name = c("Ram", "Jay", "Raj"),
  Age = c(19, 20, 19),
  Marks = c(85, 78, 90)
)

print(student)

# 📤 OUTPUT:
#   Name Age Marks
# 1  Ram  19    85
# 2  Jay  20    78
# 3  Raj  19    90


# ------------------------------------------------------------
# 🔹 Summarize Data
# ------------------------------------------------------------

# 🧠 THEORY:
# summary() gives a summary of Data Frame data.

summary(student)

# 📤 OUTPUT:
#     Name             Age            Marks
#  Length:3       Min.   :19.00   Min.   :78.00
#  Class :character 1st Qu.:19.00 1st Qu.:81.50
#  Mode :character Median :19.00  Median :85.00
#                   Mean   :19.33  Mean   :84.33
#                   3rd Qu.:19.50 3rd Qu.:87.50
#                   Max.   :20.00  Max.   :90.00


# ------------------------------------------------------------
# 🔹 Access Columns
# ------------------------------------------------------------

# 🧠 THEORY:
# Columns can be accessed using:
# [ ]
# [[ ]]
# $

print(student["Name"])
print(student[["Age"]])
print(student$Marks)

# 📤 OUTPUT:
#   Name
# 1  Ram
# 2  Jay
# 3  Raj
#
# [1] 19 20 19
#
# [1] 85 78 90


# ------------------------------------------------------------
# 🔹 Add Rows using rbind()
# ------------------------------------------------------------

# 🧠 THEORY:
# rbind() adds a new row to a Data Frame.

new_student <- data.frame(
  Name = "Amit",
  Age = 21,
  Marks = 88
)

student <- rbind(student, new_student)

print(student)

# 📤 OUTPUT:
#   Name Age Marks
# 1  Ram  19    85
# 2  Jay  20    78
# 3  Raj  19    90
# 4 Amit  21    88


# ------------------------------------------------------------
# 🔹 Add Columns using cbind()
# ------------------------------------------------------------

# 🧠 THEORY:
# cbind() adds a new column to a Data Frame.

Grade <- c("A", "B", "A+", "A")

student <- cbind(student, Grade)

print(student)

# 📤 OUTPUT:
#   Name Age Marks Grade
# 1  Ram  19    85     A
# 2  Jay  20    78     B
# 3  Raj  19    90    A+
# 4 Amit  21    88     A


# ------------------------------------------------------------
# 🔹 Remove Rows and Columns
# ------------------------------------------------------------

# 🧠 THEORY:
# c() is used to specify row/column positions.
#
# Negative indexing removes the selected row or column.

student <- student[-4, ]
student <- student[, -4]

print(student)

# 📤 OUTPUT:
#   Name Age Marks
# 1  Ram  19    85
# 2  Jay  20    78
# 3  Raj  19    90


# ------------------------------------------------------------
# 🔹 Find Rows and Columns using dim()
# ------------------------------------------------------------

# 🧠 THEORY:
# dim() returns the number of rows and columns.

print(dim(student))

# 📤 OUTPUT:
# [1] 3 3


# ------------------------------------------------------------
# 🔹 Number of Rows using nrow()
# ------------------------------------------------------------

# 🧠 THEORY:
# nrow() returns the number of rows.

print(nrow(student))

# 📤 OUTPUT:
# [1] 3


# ------------------------------------------------------------
# 🔹 Number of Columns using ncol()
# ------------------------------------------------------------

# 🧠 THEORY:
# ncol() returns the number of columns.

print(ncol(student))

# 📤 OUTPUT:
# [1] 3


# ------------------------------------------------------------
# 🔹 Data Frame Length
# ------------------------------------------------------------

# 🧠 THEORY:
# length() returns the number of columns in a Data Frame.

print(length(student))

# 📤 OUTPUT:
# [1] 3


# ------------------------------------------------------------
# 🔹 Combine Data Frames Vertically using rbind()
# ------------------------------------------------------------

# 🧠 THEORY:
# rbind() combines Data Frames vertically.
# ➡️ Rows are added one below another.

data1 <- data.frame(
  Name = c("Ram", "Jay"),
  Marks = c(85, 78)
)

data2 <- data.frame(
  Name = c("Raj", "Amit"),
  Marks = c(90, 88)
)

result1 <- rbind(data1, data2)

print(result1)

# 📤 OUTPUT:
#   Name Marks
# 1  Ram    85
# 2  Jay    78
# 3  Raj    90
# 4 Amit    88


# ------------------------------------------------------------
# 🔹 Combine Data Frames Horizontally using cbind()
# ------------------------------------------------------------

# 🧠 THEORY:
# cbind() combines Data Frames horizontally.
# ➡️ Columns are added side by side.

data3 <- data.frame(
  Name = c("Ram", "Jay", "Raj")
)

data4 <- data.frame(
  Marks = c(85, 78, 90)
)

result2 <- cbind(data3, data4)

print(result2)

# 📤 OUTPUT:
#   Name Marks
# 1  Ram    85
# 2  Jay    78
# 3  Raj    90


# ============================================================
# ⭐ CHAPTER 3 – MOST IMPORTANT FUNCTIONS
# ============================================================

# 🧠 QUICK REVISION:
#
# data.frame()  → 🗃️ Create Data Frame
# summary()     → 📋 Summarize data
# [ ]           → 🔍 Access data
# [[ ]]         → 🔍 Access data
# $             → 🔍 Access column
# rbind()       → ➕ Add/combine rows
# cbind()       → ➕ Add/combine columns
# c()           → ❌ Select/remove rows or columns
# dim()         → 📏 Rows + Columns
# nrow()        → 🔢 Number of rows
# ncol()        → 🔢 Number of columns
# length()      → 📏 Number of columns
#
# ⭐ rbind() = ROWS = Vertical ⬇️
# ⭐ cbind() = COLUMNS = Horizontal ➡️
# ⭐ dim() = ROWS + COLUMNS
#
# ============================================================
# 🎯 END OF CHAPTER 3 CODE SHEET
# ============================================================
