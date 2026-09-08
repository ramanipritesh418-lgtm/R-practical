# ============================================================
# UNIT 3 - INTRODUCTION TO R AND WORKING WITH DATA
# Statistical Methods and Data Analysis
# ============================================================


# ============================================================
# 3.1 OVERVIEW OF R
# ============================================================

# R is used for statistical analysis, data analysis
# and graphical representation.

# Simple Hello World Program
print("Hello World")

# Output:
# [1] "Hello World"


# ============================================================
# VARIABLES IN R
# ============================================================

# Simple Assignment
x = 10
print(x)

# Output:
# [1] 10


# Leftward Assignment
name <- "Pritesh"
print(name)

# Output:
# [1] "Pritesh"


# Rightward Assignment
marks <- 85
marks -> result
print(result)

# Output:
# [1] 85


# ============================================================
# COMMENTS IN R
# ============================================================

# This is a single-line comment.
# Comments are used to improve code readability.
# R ignores comments while executing the program.


# ============================================================
# KEYWORDS AND CONSTANTS
# ============================================================

# TRUE and FALSE are logical constants
print(TRUE)
print(FALSE)

# Output:
# [1] TRUE
# [1] FALSE

# NULL represents an empty/undefined value
print(NULL)

# Output:
# NULL

# NaN means Not a Number
print(0 / 0)

# Output:
# [1] NaN

# Inf means Infinity
print(10 / 0)

# Output:
# [1] Inf


# ============================================================
# 3.3 DATA TYPES IN R
# ============================================================


# ------------------------------------------------------------
# 1. NUMERIC
# ------------------------------------------------------------

numeric_value <- 3.14

print(numeric_value)
print(class(numeric_value))

# Output:
# [1] 3.14
# [1] "numeric"


# ------------------------------------------------------------
# 2. INTEGER
# ------------------------------------------------------------

integer_value <- 42L

print(integer_value)
print(class(integer_value))
print(typeof(integer_value))

# Output:
# [1] 42
# [1] "integer"
# [1] "integer"


# Integer using as.integer()
x <- as.integer(5)

print(class(x))

# Output:
# [1] "integer"


# ------------------------------------------------------------
# 3. LOGICAL
# ------------------------------------------------------------

logical_value <- TRUE

print(logical_value)
print(class(logical_value))

# Output:
# [1] TRUE
# [1] "logical"


# ------------------------------------------------------------
# 4. COMPLEX
# ------------------------------------------------------------

complex_value <- 1 + 2i

print(complex_value)
print(class(complex_value))

# Output:
# [1] 1+2i
# [1] "complex"


# ------------------------------------------------------------
# 5. CHARACTER
# ------------------------------------------------------------

character_value <- "Hello R"

print(character_value)
print(class(character_value))

# Output:
# [1] "Hello R"
# [1] "character"


# ------------------------------------------------------------
# 6. RAW
# ------------------------------------------------------------

single_raw <- as.raw(255)

print(single_raw)
print(class(single_raw))

# Output:
# [1] ff
# [1] "raw"


# ============================================================
# FIND DATA TYPE USING class()
# ============================================================

print(class(TRUE))
print(class(3L))
print(class(10.5))
print(class(1 + 2i))
print(class("Hello"))

# Output:
# [1] "logical"
# [1] "integer"
# [1] "numeric"
# [1] "complex"
# [1] "character"


# ============================================================
# TYPE VERIFICATION USING is. FUNCTIONS
# ============================================================

print(is.logical(TRUE))
print(is.integer(3L))
print(is.numeric(10.5))
print(is.complex(1 + 2i))
print(is.character("Hello"))

# Output:
# [1] TRUE
# [1] TRUE
# [1] TRUE
# [1] TRUE
# [1] TRUE


# Checking incorrect data types
print(is.integer("Hello"))
print(is.numeric("Hello"))

# Output:
# [1] FALSE
# [1] FALSE


# ============================================================
# DATA TYPE CONVERSION / COERCION
# ============================================================

# Logical to Numeric
print(as.numeric(TRUE))

# Output:
# [1] 1


# Integer to Complex
print(as.complex(3L))

# Output:
# [1] 3+0i


# Numeric to Logical
print(as.logical(10.5))

# Output:
# [1] TRUE


# Complex to Character
print(as.character(1 + 2i))

# Output:
# [1] "1+2i"


# Invalid conversion
print(as.numeric("12-04-2020"))

# Output:
# [1] NA

# Warning:
# NAs introduced by coercion


# ============================================================
# 3.4 IMPORTING DATA INTO R
# ============================================================

# Data can be imported into R from different file formats
# such as CSV, TXT, Excel, JSON and XML.


# ============================================================
# IMPORT CSV FILE USING read.csv()
# ============================================================

# Example CSV file:
#
# ID,Name,Age
# 1,Amit,20
# 2,Ravi,21
# 3,Neha,20
#
# Save this file as:
# students.csv

# Read CSV file
data_csv <- read.csv("students.csv")

# Display CSV data
print(data_csv)

# View first rows
head(data_csv)

# Note:
# The CSV file must be present in the current working directory.


# ============================================================
# CSV USING FILE PATH
# ============================================================

# Example:
# data_csv <- read.csv("D:/Data/students.csv")
# print(data_csv)

# In R, forward slash / is commonly used in file paths.


# ============================================================
# IMPORT CSV USING read.table()
# ============================================================

# read.table() can also read CSV files.
# sep="," means values are separated by comma.
# header=TRUE means first row contains column names.

# Example:
# data_csv2 <- read.table(
#   "students.csv",
#   sep=",",
#   header=TRUE
# )
#
# print(data_csv2)


# ============================================================
# IMPORT TXT FILE USING read.table()
# ============================================================

# Example TXT file:
#
# ID Name Age
# 1 Amit 20
# 2 Ravi 21
# 3 Neha 20
#
# Save as:
# students.txt

# Read TXT file
# data_txt <- read.table(
#   "students.txt",
#   header=TRUE
# )
#
# print(data_txt)


# ============================================================
# IMPORT DELIMITED FILE USING read.delim()
# ============================================================

# read.delim() is used to read delimiter-separated files.
# By default, values are separated by TAB.

# Example:
# data_delim <- read.delim(
#   "students.txt",
#   header=TRUE
# )
#
# print(data_delim)


# ============================================================
# IMPORT FILE WITH "|" SEPARATOR
# ============================================================

# If the data is separated by | symbol:

# Example:
# data_pipe <- read.delim(
#   "students.csv",
#   sep="|",
#   header=TRUE
# )
#
# print(data_pipe)


# ============================================================
# IMPORT JSON FILE
# ============================================================

# JSON files can be imported using the rjson package.

# Install package (run only once):
# install.packages("rjson")

# Load package:
# library(rjson)

# Read JSON file:
# json_data <- fromJSON(file="students.json")

# Display JSON data:
# print(json_data)


# ============================================================
# IMPORT XML FILE
# ============================================================

# XML files can be imported using XML package.

# Install package (run only once):
# install.packages("XML")

# Load package:
# library(XML)

# Read XML file:
# xml_data <- xmlParse("students.xml")

# Display XML data:
# print(xml_data)


# ============================================================
# IMPORT TXT FILE USING read.delim()
# ============================================================

# read.delim() can also be used to read TXT files.

# Example:
# data_txt2 <- read.delim(
#   "students.txt",
#   header=FALSE
# )
#
# print(data_txt2)


# ============================================================
# IMPORT EXCEL FILE INTO R
# ============================================================

# Excel files can be imported using the readxl package.

# Install package (run only once):
# install.packages("readxl")

# Load package:
# library(readxl)

# Read Excel file:
# data_excel <- read_excel(
#   "students.xlsx",
#   sheet=1
# )

# Display Excel data:
# print(data_excel)

# View first 5 rows:
# head(data_excel, 5)


# ============================================================
# 3.5 DATA FRAMES
# ============================================================

# A Data Frame is a table-like structure
# containing data in rows and columns.


# ============================================================
# CREATE DATA FRAME
# ============================================================

student <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Amit", "Ravi", "Neha"),
  Age = c(20, 21, 20),
  Marks = c(75, 82, 90)
)

# Display Data Frame
print(student)

# Output:
#   ID Name Age Marks
# 1  1 Amit  20    75
# 2  2 Ravi  21    82
# 3  3 Neha  20    90


# ============================================================
# VIEW DATA
# ============================================================

# Display complete Data Frame
print(student)

# Display first rows
head(student)

# Display first 2 rows
head(student, 2)


# ============================================================
# SUMMARIZE DATA
# ============================================================

summary(student)

# summary() provides statistical summary
# of the Data Frame.


# ============================================================
# ACCESS COLUMN USING [ ]
# ============================================================

print(student["Name"])

# Output:
# Name
# Amit
# Ravi
# Neha


# ============================================================
# ACCESS COLUMN USING [[ ]]
# ============================================================

print(student[["Name"]])

# Output:
# [1] "Amit" "Ravi" "Neha"


# ============================================================
# ACCESS COLUMN USING $
# ============================================================

print(student$Name)

# Output:
# [1] "Amit" "Ravi" "Neha"


# ============================================================
# ACCESS MARKS COLUMN
# ============================================================

print(student$Marks)

# Output:
# [1] 75 82 90


# ============================================================
# ADD NEW ROW USING rbind()
# ============================================================

student <- rbind(
  student,
  data.frame(
    ID = 4,
    Name = "Raj",
    Age = 22,
    Marks = 88
  )
)

print(student)

# Output:
#   ID Name Age Marks
# 1  1 Amit  20    75
# 2  2 Ravi  21    82
# 3  3 Neha  20    90
# 4  4  Raj  22    88


# ============================================================
# ADD NEW COLUMN USING cbind()
# ============================================================

student <- cbind(
  student,
  Grade = c("B", "A", "A+", "A")
)

print(student)

# Output:
#   ID Name Age Marks Grade
# 1  1 Amit  20    75     B
# 2  2 Ravi  21    82     A
# 3  3 Neha  20    90    A+
# 4  4  Raj  22    88     A


# ============================================================
# FIND ROWS AND COLUMNS USING dim()
# ============================================================

print(dim(student))

# Output:
# [1] 4 5
#
# 4 = Number of rows
# 5 = Number of columns


# ============================================================
# FIND NUMBER OF ROWS USING nrow()
# ============================================================

print(nrow(student))

# Output:
# [1] 4


# ============================================================
# FIND NUMBER OF COLUMNS USING ncol()
# ============================================================

print(ncol(student))

# Output:
# [1] 5


# ============================================================
# FIND NUMBER OF COLUMNS USING length()
# ============================================================

print(length(student))

# Output:
# [1] 5


# ============================================================
# REMOVE A ROW
# ============================================================

# Remove second row
student_without_row <- student[-2, ]

print(student_without_row)

# Output:
# Second row is removed.


# ============================================================
# REMOVE A COLUMN
# ============================================================

# Remove third column (Age)
student_without_column <- student[, -3]

print(student_without_column)

# Output:
# Third column is removed.


# ============================================================
# COMBINE DATA FRAMES VERTICALLY
# USING rbind()
# ============================================================

student1 <- data.frame(
  ID = c(1, 2),
  Name = c("Amit", "Ravi")
)

student2 <- data.frame(
  ID = c(3, 4),
  Name = c("Neha", "Raj")
)

# Combine rows
combined_rows <- rbind(student1, student2)

print(combined_rows)

# Output:
#   ID Name
# 1  1 Amit
# 2  2 Ravi
# 3  3 Neha
# 4  4  Raj


# ============================================================
# COMBINE DATA FRAMES HORIZONTALLY
# USING cbind()
# ============================================================

student_id <- data.frame(
  ID = c(1, 2, 3)
)

student_name <- data.frame(
  Name = c("Amit", "Ravi", "Neha")
)

# Combine columns
combined_columns <- cbind(
  student_id,
  student_name
)

print(combined_columns)

# Output:
#   ID Name
# 1  1 Amit
# 2  2 Ravi
# 3  3 Neha


# ============================================================
# IMPORTANT FUNCTIONS - QUICK REVISION
# ============================================================

# data.frame() -> Create Data Frame
# summary()    -> Summarize Data
# head()       -> View first rows
# rbind()      -> Add/combine rows
# cbind()      -> Add/combine columns
# dim()        -> Rows and columns
# nrow()       -> Number of rows
# ncol()       -> Number of columns
# length()     -> Number of columns
# read.csv()   -> Read CSV file
# read.table() -> Read TXT/table data
# read.delim() -> Read delimiter-separated data
# read_excel() -> Read Excel file
# fromJSON()   -> Read JSON data
# xmlParse()   -> Read XML data


# ============================================================
# END OF UNIT 3
# ============================================================