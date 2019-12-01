---
title: "CodeBook"
output: html_document
---

## Sources
* Full description at the site where the data was obtained:  (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* Data for the project(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Further details in files
     * Readme
     * features_info.txt


## Dataset merged4analysis

* ActivityNr: identiefier of the activity carried out in the experiment
* ActivityLabel: label describing the activity carried out in the experiment
* SubjectNr: identifier of the volunteer carrying out the experiment
* Variables with measures, structured as followes:
     * Time/Frequency: Time domain signals / Frequency domain signals
     * Body_Acceleration/Gravity_Accelleration/Body_Gyroscopic: body accelleration / gravity acceleration / angular velocity
     * Jerk: Jerk signals 
     * Magnitude: the magnitude of three-dimensional signals were calculated using the Euclidean norm 
     * X/Y/Z-direction: 3-axial signals in the X, Y and Z directions
     * Mean value / Standard deviation: the statistics of the measure


## Dataset NewSet
* SubjectNr: identifier of the volunteer carrying out the experiment
* ActivityLabel: label describing the activity carried out in the experiment
* Mean of each variable measured
* Variables with measures, structured as follows:
    * Time/Frequency: Time domain signals / Frequency domain signals
    * Body_Acceleration/Gravity_Accelleration/Body_Gyroscopic: body accelleration / gravity acceleration / angular velocity
     * Jerk: Jerk signals 
     * Magnitude: the magnitude of three-dimensional signals were calculated using the Euclidean norm 
     * X/Y/Z-direction: 3-axial signals in the X, Y and Z directions
     * Mean value / Standard deviation: the statistics of the measure

