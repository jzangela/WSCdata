% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Big5_WSC.R
\docType{data}
\name{Big5_WSC}
\alias{Big5_WSC}
\title{Big 5 Dataset}
\format{
Big5_WSC is a data frame with 2200 cases (rows) and 44 variables (columns).
The variables are named O1-O10, C1-C9, E1-E8, A1-A9, and N1-N8.
}
\source{
Keller et al., ....
}
\usage{
data(Big5_WSC)
}
\description{
This dataset contains Big 5 personality trait measurements using the Big Five Inventory (BFI)
on 2,200 Amazon Mechanical Turk workers (Keller et al., ...). The items include both
positively and negatively worded statements. Therefore, reverse coding is necessary
for certain items before conducting any psychometric analysis.
}
\details{
The Big 5 personality test comprises five scales: Openness (O) with 10 items,
Conscientiousness (C) with 9 items, Extraversion (E) with 8 items, Agreeableness (A)
with 9 items, and Neuroticism (N) with 8 items.
}
\examples{
summary(Big5_WSC)
}
\references{
John, O. P., & Srivastava, S. (1999). The big ﬁve trait taxonomy: History, measurement,
and theoretical perspectives. In L. A. Pervin & O. P. John (Eds.), Handbook of
personality: Theory and research (pp. 102–138). New York, NY: Guilford Press.
}
\keyword{datasets}
