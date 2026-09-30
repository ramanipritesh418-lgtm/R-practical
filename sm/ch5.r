# ============================================================
# 📘 UNIT 5 — WORKING WITH DATA IN R
# 💻 COMPLETE R CODE SHEET
# 📚 Topics: 5.1 to 5.7
# ============================================================


# ============================================================
# 🔹 5.1 REORDERING AND RESHAPING DATA FRAMES
# ============================================================

# 📌 Reordering means changing the order of rows.
# 📌 order() is used to arrange data according to a variable.
# 📌 Ascending order is the default.
# 📌 decreasing = TRUE gives descending order.


# ------------------------------------------------------------
# 🔼 Create Data Frame
# ------------------------------------------------------------

student <- data.frame(
  Name = c("Ram", "Jay", "Raj", "Amit"),
  Marks = c(75, 90, 65, 85)
)

student

# 📤 Output:
#   Name Marks
# 1  Ram    75
# 2  Jay    90
# 3  Raj    65
# 4 Amit    85


# ------------------------------------------------------------
# 🔼 Reorder in Ascending Order
# ------------------------------------------------------------

student[order(student$Marks), ]

# 📤 Output:
#   Name Marks
# 3  Raj    65
# 1  Ram    75
# 4 Amit    85
# 2  Jay    90


# ------------------------------------------------------------
# 🔽 Reorder in Descending Order
# ------------------------------------------------------------

student[order(student$Marks, decreasing = TRUE), ]

# 📤 Output:
#   Name Marks
# 2  Jay    90
# 4 Amit    85
# 1  Ram    75
# 3  Raj    65


# ------------------------------------------------------------
# 📌 Reshaping Data
# ------------------------------------------------------------

# 📌 Reshaping means changing the structure or arrangement
# of a data frame.
#
# 📌 reshape() can convert data between wide and long forms.


# ------------------------------------------------------------
# 🔹 Wide Data
# ------------------------------------------------------------

student_wide <- data.frame(
  ID = c(1, 2),
  Math = c(80, 90),
  Science = c(85, 95)
)

student_wide

# 📤 Output:
#   ID Math Science
# 1  1   80      85
# 2  2   90      95


# ------------------------------------------------------------
# 🔹 Wide → Long using reshape()
# ------------------------------------------------------------

student_long <- reshape(
  student_wide,
  varying = c("Math", "Science"),
  v.names = "Marks",
  timevar = "Subject",
  times = c("Math", "Science"),
  idvar = "ID",
  direction = "long"
)

student_long

# 📤 Output:
#   ID Subject Marks
# 1  1   Math    80
# 2  2   Math    90
# 1  1 Science    85
# 2  2 Science    95


# ------------------------------------------------------------
# 🔹 Long → Wide using reshape()
# ------------------------------------------------------------

student_wide_again <- reshape(
  student_long,
  idvar = "ID",
  timevar = "Subject",
  direction = "wide"
)

student_wide_again

# 📤 Output:
#   ID Marks.Math Marks.Science
# 1  1         80           85
# 2  2         90           95



# ============================================================
# 🔹 5.2 MERGING AND JOINING DATA FRAMES
# ============================================================

# 📌 Merging means combining two data frames
# using a common column.
#
# 📌 The common column is generally called a key.


# ------------------------------------------------------------
# 🔹 Create Student Data
# ------------------------------------------------------------

student <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Ram", "Jay", "Raj")
)

marks <- data.frame(
  ID = c(1, 2, 3),
  Marks = c(85, 90, 75)
)


# ------------------------------------------------------------
# 🔹 merge()
# ------------------------------------------------------------

merge(student, marks, by = "ID")

# 📤 Output:
#   ID Name Marks
# 1  1  Ram    85
# 2  2  Jay    90
# 3  3  Raj    75


# ------------------------------------------------------------
# 🔹 Join Data for Different IDs
# ------------------------------------------------------------

student <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Ram", "Jay", "Raj")
)

marks <- data.frame(
  ID = c(1, 2, 4),
  Marks = c(85, 90, 75)
)

library(dplyr)


# ------------------------------------------------------------
# 1️⃣ INNER JOIN
# ------------------------------------------------------------

# 📌 Returns only matching rows from both data frames.

inner_join(student, marks, by = "ID")

# 📤 Output:
#   ID Name Marks
# 1  1  Ram    85
# 2  2  Jay    90


# ------------------------------------------------------------
# 2️⃣ LEFT JOIN
# ------------------------------------------------------------

# 📌 Returns all rows from the left data frame
# and matching rows from the right data frame.

left_join(student, marks, by = "ID")

# 📤 Output:
#   ID Name Marks
# 1  1  Ram    85
# 2  2  Jay    90
# 3  3  Raj    NA


# ------------------------------------------------------------
# 3️⃣ RIGHT JOIN
# ------------------------------------------------------------

# 📌 Returns all rows from the right data frame
# and matching rows from the left data frame.

right_join(student, marks, by = "ID")

# 📤 Output:
#   ID Name Marks
# 1  1  Ram    85
# 2  2  Jay    90
# 3  4  NA     75


# ------------------------------------------------------------
# 4️⃣ FULL JOIN
# ------------------------------------------------------------

# 📌 Returns all rows from both data frames.

full_join(student, marks, by = "ID")

# 📤 Output:
#   ID Name Marks
# 1  1  Ram    85
# 2  2  Jay    90
# 3  3  Raj    NA
# 4  4  NA     75


# 🧠 QUICK MEMORY:
# merge()       → Merge data frames
# inner_join()  → Matching rows
# left_join()   → All left rows
# right_join()  → All right rows
# full_join()   → All rows



# ============================================================
# 🔹 5.3 CALCULATING SUMMARY STATISTICS
# ============================================================

# 📌 Summary statistics describe the main characteristics
# of a dataset.
#
# Important measures:
# 📊 Mean
# 📊 Median
# 📊 Mode
# 📊 Standard Deviation


# ------------------------------------------------------------
# 1️⃣ MEAN
# ------------------------------------------------------------

# 📌 Mean is the average value.

x <- c(10, 20, 30, 40, 50)

mean(x)

# 📤 Output:
# [1] 30


# ------------------------------------------------------------
# 2️⃣ MEDIAN
# ------------------------------------------------------------

# 📌 Median is the middle value after arranging data.

median(x)

# 📤 Output:
# [1] 30


# ------------------------------------------------------------
# 3️⃣ MODE
# ------------------------------------------------------------

# 📌 Mode is the most frequently occurring value.
# 📌 R's basic mode() function does not calculate
# statistical mode.
#
# 📌 table() + sort() can be used.

x <- c(10, 20, 20, 30, 20, 40)

mode_value <- names(sort(table(x), decreasing = TRUE))[1]

mode_value

# 📤 Output:
# [1] "20"


# ------------------------------------------------------------
# 4️⃣ STANDARD DEVIATION
# ------------------------------------------------------------

# 📌 Standard deviation measures the spread of data
# around the mean.

x <- c(10, 20, 30, 40, 50)

sd(x)

# 📤 Output:
# [1] 15.81139



# ============================================================
# 🔹 5.4 FREQUENCY TABLES AND CROSS-TABULATIONS
# ============================================================

# 📌 Frequency table shows how many times
# each value occurs.


# ------------------------------------------------------------
# 🔹 Frequency Table
# ------------------------------------------------------------

gender <- c("Male", "Female", "Male", "Male", "Female")

table(gender)

# 📤 Output:
# gender
# Female   Male
#      2      3


# ------------------------------------------------------------
# 🔹 Frequency Table for Marks
# ------------------------------------------------------------

marks <- c(10, 20, 20, 30, 30, 30, 40)

table(marks)

# 📤 Output:
# marks
# 10 20 30 40
#  1  2  3  1


# ------------------------------------------------------------
# 🔹 Cross-Tabulation
# ------------------------------------------------------------

# 📌 Cross-tabulation shows the relationship
# between two categorical variables.
#
# 📌 Syntax:
# table(variable1, variable2)

gender <- c("Male", "Female", "Male", "Female", "Male")

result <- c("Pass", "Pass", "Fail", "Pass", "Fail")

table(gender, result)

# 📤 Output:
#         result
# gender   Fail Pass
# Female      0    2
# Male        2    1



# ============================================================
# 🔹 5.5 COMMANDS FOR CENTRAL TENDENCY AND DISPERSION
# ============================================================

# 📌 Central Tendency:
# Mean, Median and Mode
#
# 📌 Dispersion:
# Range, Variance and Standard Deviation.


x <- c(10, 20, 30, 40, 50)


# ------------------------------------------------------------
# 🔹 Mean
# ------------------------------------------------------------

mean(x)

# 📤 Output:
# [1] 30


# ------------------------------------------------------------
# 🔹 Median
# ------------------------------------------------------------

median(x)

# 📤 Output:
# [1] 30


# ------------------------------------------------------------
# 🔹 Mode
# ------------------------------------------------------------

x_mode <- c(10, 20, 20, 30, 20, 40)

names(sort(table(x_mode), decreasing = TRUE))[1]

# 📤 Output:
# [1] "20"


# ------------------------------------------------------------
# 🔹 Range
# ------------------------------------------------------------

range(x)

# 📤 Output:
# [1] 10 50


# ------------------------------------------------------------
# 🔹 Range Value
# ------------------------------------------------------------

max(x) - min(x)

# 📤 Output:
# [1] 40


# ------------------------------------------------------------
# 🔹 Variance
# ------------------------------------------------------------

var(x)

# 📤 Output:
# [1] 250


# ------------------------------------------------------------
# 🔹 Standard Deviation
# ------------------------------------------------------------

sd(x)

# 📤 Output:
# [1] 15.81139


# 🧠 QUICK MEMORY:
# mean(x)       → Mean
# median(x)     → Median
# table()       → Mode / Frequency
# max()-min()   → Range
# var(x)        → Variance
# sd(x)         → Standard Deviation



# ============================================================
# 🔹 5.6 CONCEPT OF NORMAL DISTRIBUTION
# ============================================================

# 📌 Normal Distribution is a continuous probability
# distribution.
#
# 🔔 It has a bell-shaped curve.
# ⚖️ It is symmetrical around the mean.
# 📊 Mean = Median = Mode.
# 🎯 Most observations are near the mean.
# 📉 Frequency decreases toward the tails.
#
# 📌 Empirical Rule:
# 68%   → Mean ± 1 SD
# 95%   → Mean ± 2 SD
# 99.7% → Mean ± 3 SD


# ------------------------------------------------------------
# 🔹 Generate Normal Distribution Values
# ------------------------------------------------------------

x <- seq(-4, 4, length.out = 100)

y <- dnorm(x, mean = 0, sd = 1)

y

# 📤 Output:
# Numeric density values are displayed.


# ------------------------------------------------------------
# 🔹 Check Normal Distribution Density
# ------------------------------------------------------------

dnorm(0, mean = 0, sd = 1)

# 📤 Output:
# [1] 0.3989423



# ============================================================
# 🔹 5.7 GRAPHICAL DATA DISTRIBUTION
# ============================================================

# 📌 R provides graphical commands to explore
# and view data distributions.
#
# Important functions:
# hist()    → Histogram
# boxplot() → Box Plot
# plot()    → General / Scatter Plot
# curve()   → Mathematical curve
# dnorm()   → Normal distribution density


# ------------------------------------------------------------
# 1️⃣ HISTOGRAM
# ------------------------------------------------------------

# 📌 Histogram displays the distribution
# of numerical data.

x <- c(10, 12, 15, 18, 20, 22, 25, 28, 30, 32)

hist(
  x,
  main = "Histogram",
  xlab = "Values",
  ylab = "Frequency"
)

# 📤 Output:
# 📊 A histogram showing the frequency
# distribution of values is displayed.


# ------------------------------------------------------------
# 2️⃣ BOX PLOT
# ------------------------------------------------------------

# 📌 Box plot shows distribution and spread of data.

boxplot(
  x,
  main = "Box Plot",
  ylab = "Values"
)

# 📤 Output:
# 📦 A box plot showing median,
# spread and possible outliers is displayed.


# ------------------------------------------------------------
# 3️⃣ SCATTER PLOT
# ------------------------------------------------------------

# 📌 Scatter plot shows the relationship
# between two numerical variables.

x <- c(10, 20, 30, 40, 50)

y <- c(15, 25, 35, 45, 55)

plot(
  x,
  y,
  main = "Scatter Plot",
  xlab = "X Values",
  ylab = "Y Values"
)

# 📤 Output:
# 📈 A scatter plot showing the relationship
# between X and Y values is displayed.


# ------------------------------------------------------------
# 4️⃣ BELL CURVE using dnorm()
# ------------------------------------------------------------

# 📌 dnorm() gives the density values
# of the normal distribution.

x <- seq(-4, 4, length.out = 100)

y <- dnorm(
  x,
  mean = 0,
  sd = 1
)

plot(
  x,
  y,
  type = "l",
  main = "Normal Distribution",
  xlab = "Values",
  ylab = "Density"
)

# 📤 Output:
# 🔔 A symmetrical bell-shaped normal
# distribution curve is displayed.


# ------------------------------------------------------------
# 5️⃣ BELL CURVE using curve()
# ------------------------------------------------------------

# 📌 curve() is used to draw a mathematical curve.

curve(
  dnorm(x, mean = 0, sd = 1),
  from = -4,
  to = 4,
  main = "Bell Curve",
  xlab = "Values",
  ylab = "Density"
)

# 📤 Output:
# 🔔 A bell-shaped symmetrical curve is displayed.


# ============================================================
# 🧠 ⭐ UNIT 5 FINAL QUICK REVISION
# ============================================================

# 5.1 REORDERING & RESHAPING
# order()    → Reorder data
# reshape()  → Reshape data
#
# 5.2 MERGING & JOINING
# merge()       → Merge data frames
# inner_join()  → Matching rows
# left_join()   → All left rows
# right_join()  → All right rows
# full_join()  → All rows
#
# 5.3 SUMMARY STATISTICS
# mean()        → Mean
# median()      → Median
# Mode method   → Most frequent value
# sd()          → Standard Deviation
#
# 5.4 FREQUENCY TABLE
# table()       → Frequency table
# table(A, B)   → Cross-tabulation
#
# 5.5 CENTRAL TENDENCY & DISPERSION
# mean()        → Mean
# median()      → Median
# Mode          → Most frequent value
# max()-min()   → Range
# var()         → Variance
# sd()          → Standard Deviation
#
# 5.6 NORMAL DISTRIBUTION
# 🔔 Bell-shaped
# ⚖️ Symmetrical
# 📊 Mean = Median = Mode
# 68%   → 1 SD
# 95%   → 2 SD
# 99.7% → 3 SD
#
# 5.7 GRAPHICAL DISTRIBUTION
# hist()        → Histogram
# boxplot()     → Box Plot
# plot()        → Scatter / General Plot
# dnorm()       → Normal density
# curve()       → Bell Curve
#
# ============================================================
# 🎯 UNIT 5 COMPLETE
# ============================================================
''' 

path = Path("/mnt/data/Chapter_5_Working_with_Data.R")
path.write_text(content, encoding="utf-8")
print(path)
print(f"Lines: {len(content.splitlines())}")
print("Ready for GitHub.")
