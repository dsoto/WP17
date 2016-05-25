# Abstract

- new generation in under-served areas often too high
- we compare survey estimation to observed electricity use


# Introduction

## Global Topic

- global electricity access is poor
- many areas require private capital to install electricity
- part of problem is upfront investment cost
- due to perceived business risk, upfront capital is costly [@JaramilloReview2015]

## Oversizing

- generation is frequently allocated at levels that are too high
- oversized microgrids based on overestimated demand that cannot meet
    revenue targets contribute to this perception [@USAID2015]
- Schnitzer has shown the consequences of generators with excess
    capacity on microgrid operation [@Schnitzer2014]
- Schnitzer Haiti Thesis data can provide evidence
- quantify the level and frequency of generator mismatch
- to avoid excess capacity, systems must be sized appropriately
- accurate sizing requires accurate demand estimation

## Demand estimation informs sizing

- estimating demand in areas without access is challenging (citation)
- through more accurate appliance estimation, we may achieve more
    accurate energy estimation
- with more accurate energy estimation, a micro-utility can reduce
    the variance in revenue
- reductions in revenue variance should lead to lower-cost capital
    [@JaramilloReview2015]
- we explore methods for bottom up estimation of appliance ownership
    and compare to observed electricity consumption

## Contribution

- more accurate forecasting of appliance purchases, use, and resulting
    electricity demand can improve financial performance by improving
    the procurement of power generation equipment
- we use surveys of rural household appliance ownership and compare to
    observed electricity consumption to verify the accuracy of a
    bottom-up method

## literature review of rural energy forecast theory and results

- Schnitzer Thesis
- Paatero
- ASHRAE Fundamentals Ch. 19
- World Bank WPS4866




# Methods Overview

- We compare observed electricity consumption with a bottom-up
    estimation based on appliance survey data
- Collect survey data on current per household appliance ownership
    including hours of operation
- Extrapolate energy usage based on a estimations of power
- Measure distribution of daily energy for measured villages
- Compare predicted to observed energy usage from metered villages

## Lake Sentani Description

<!-- todo: village sizes -->

- Lake Sentani is an inland lake in Indonesia
- Near the coastal city of Jayapura
- Many island communities
- Area is surrounded by some grid access
- Other areas accessed by community or utility administered microgrids


![Lake Sentani Satellite Photo](./figures/lake-sentani.png)

## Survey Basic Description

- The survey was designed to ask questions relevant to the electricity needs of the community
- The survey was designed and administered by Advancing Energy and Cenderwash University as part of an electrification effort in the Lake Sentani region
- Survey carried out in Q3 and Q4 of 2014
- The survey used the ODK platform which allows for the electronic collection of data from hand-held tablet devices
- The data was stored online using Ona
- The survey collected data on electricity use and assets for 1184 households in the Lake Sentani region
<!-- is this different for each appliance? -->
<!-- TODO: place these valid survey numbers in a table -->
<!-- TODO: we don't have the valid time usage surveys tabulated -->
<!-- TODO: decide whether or not to break these out by access type -->
<!-- TODO: what notation should I use for village type or access type? -->
- $N_{h}$ is the total number of households present in the area of interest
- $N_{vos}$ is the number of surveys with valid appliance ownership responses
- $N_{vts}$ is the number of surveys with valid appliance time usage responses

<!-- survey_counts.ipynb -->

Table: Number of surveys.
Percent surveyed is the percentage of all households in each category that were given a survey.
Valid fraction, is the percentage of all households in each category that have complete responses for the appliance ownership and usage questions.

|                     | total_surveys | AE_count | percent_surveyed | valid_fraction_HH |
|:--------------------|--------------:|---------:|-----------------:|------------------:|
| PLN_grid            |           619 |      660 |         0.937879 |          0.860606 |
| PLN_microgrid       |           170 |      170 |         1        |          0.929412 |
| community_microgrid |            54 |       60 |         0.9      |          0.866667 |
| no_access           |           341 |      398 |         0.856784 |          0.645729 |

- The survey covered dozens of villages with different levels of electricity access.
- 26 Villages were surveyed
- We define three access types: grid, microgrid, no centralized
- Electricity access among the surveyed households ranged from grid access to village-level access, to only household-level sources of energy
- Range of percentage of households surveyed per village
- Average households surveyed per village
- Percentage of households surveyed per village
- Percentage of households by access type
- Of the total households available in a given village, the percentage surveyed ranged from 45% to 75%


# Bottom Up Electricity Estimation

- We use our survey instrument to estimate the electricity use by villages
- Information on the ownership of appliances and their use are combined with assumptions about the power level of appliances to form an estimate.
- We start by demonstrating patterns of ownership of appliances
- We then add information on the patterns of usage of appliances
- We combine these patterns of usage with assumptions and measurements of appliance power to create energy usage estimates
- In a later section, we will compare these energy usage estimates to the measured consumption.

## Appliance Ownership

- We infer the proportion of the village households owning a given appliance category from our survey data questions on ownership.
- We assume that the population responding to surveys have similar ownership patterns to the non-respondents.
- We observe the reported percentage of appliance ownership in each access type or village by summing the yes/no response and dividing by the number of respondents
- We observe a low variation for TV, lighting, and mobile phone ownership across access types
- These are highly desirable services with modest energy requirements
- Surveys indicate these appliances are used in areas without central access suggesting high usage of household-level electricity generation, likely from small petrol generators.
- We observe higher ownership of rice cookers and refrigerators in areas with grid connections
- Since these appliances require greater power and energy, we expect grid locations
- We observe higher radio ownership with in microgrid areas
- $A_{h, i}$ is a 1 or zero variable for the presence of appliance type $i$ in surveyed household $h$
- $F_{i} = \frac{1}{N_{vos}} \sum_{h}^{N_{vos}} A_{h, i}$ is the fraction of households owning appliance type $i$ and $N_s$ is the number of households with valid appliance surveys
- We calculate $F_{i}$ over different samples like villages or access types

![Percent Ownership: Plots percentages of households reporting ownership of each type of appliance based on current electricity access type.](figures/appliance-ownership-by-access-type.png)

## Appliance Usage

- We observe the variation in hours per week of usage of each type of appliance through survey questions.
- We collect statistics on the hours per week that appliance use is reported
- We assume the population of non-responses has the same composition as the respondents
- We report for lighting, mobile phones, television, radio, refrigerators, fans, and rice cookers
- We report these measurements as per household averages over the entire survey population

<!-- what are the variations in appliance hours? -->
<!-- this needs elaboration in the supplemental material -->
<!-- see notebooks from feb 2016 -->

- $NAO_{i}$ is the number of appliance owners for appliance type $i$.
- $NTD_{i}$ is the number of households reporting time data for each appliance
- $HD_{h, i}$ is the number of hours per day that appliance type $i$ in surveyed household $h$ is used for households that report owning appliance $i$.
- $WF_{h, i}$ is the number of times per week that appliance type $i$ in surveyed household $h$ is used for households that report owning appliance $i$.
- $HW_{h, i} = HD_{h,i} WF_{h,i}$ is the number of hours per week that appliance type $i$ in surveyed household $h$ is used where that appliance is owned.
- $MHW_{i} = \frac{1}{NTD{i}} \sum_h^{NTD_i} HW_{h,i}$ is the mean hours per week for each type of appliance.
- Note that the number of households computed in the mean is different for different appliances.



## Electricity Estimates

- From these estimates of appliance prevalence and frequency and duration of use, we can estimate the average household energy use.
- We also estimate the power level of appliances.
- Multiplying the average power by the hours of use per day gives the energy per day
- From each of these appliance types, we can estimate the overall energy usage per household.
- We calculate the energy use per appliance type for each household and then average over households for each appliance type to get the average energy use per overall household for each appliance type.
- By summing over these appliance types, we can estimate the overall electricity use
- P(appliance ownership|survey respondent) = P(appliance ownership|non-respondent)
- We perform an imputation
- If a household reported owning appliance but did not report the hours of use, we assumed the hours were the average of the other responses
- From this, we create an estimate of the energy per day consumed if all appliances working and grid has 100% uptime
- From this method we can estimate the total energy use as well as the contribution of each type of appliance
- $HWV_{i} = MHW_{i} F_{i} N_{v}$ is the number of hours of appliance use of type $i$ in village $v$.
- $F_{i}$ is calculated from the number of appliance owners and the total number of households.
- $E_{i} = HWV_{i} P_i$ where $P_i$ is the average power of appliance type $i$.

## Averaging Methods per appliance type and access type

- We convert these household measurements into a village average
- Given the measurements in the responding households, what is our estimate of the village-level electricity consumption?
- We average usage over a village, since this is the natural unit of new electrification in this area.
- $E_{h, v}$ is the total daily electricity energy per household given a village
- $E_{h, v, i}$ is the daily electricity energy per household given a village of appliance type $i$

$$E_{h, v} = \sum_i E_{h, v, i}$$

<!-- TODO: make notation below consistent with the above -->

$$ E_{h, i} = P_{i} F_{i} H_{i} / 7 $$

- $E_{d,i}$ is the daily energy per household for appliance type $i$
- $P_i$ is the assumed average power for appliance type $i$
- $F_i$ is the number of times per week appliance type $i$ is used
- $H_i$ is the number of hours per day, on days of use, that appliance $i$ is used

<!-- incorporate existing notes from lab book -->

- To estimate the village energy, we calculate the average $E_{d, i}$ for households owning that appliance type and extrapolate for the whole village.

<!-- fix this notation: -->

$$ E_{v,i} = mean( E_{h,i} ) N_{v,h} / N_{h,i} $$

- $E_{v,i}$ is the daily energy in village $v$ for appliance $i$
- $N_{v,h}$ is the number of connected households in village $v$
- $N_{v,i}$ is the number of households using appliance $i$

- We observe two contributions to variation
    - Patterns of appliance ownership
    - Patterns of appliance usage
- If these villages are similar in other respects, we expect the locations with less reliable electricity to change their behavior to be similar to the grid when reliable electricity arrives.
- Latent demand has two factors, appliance purchase and service increase


## Variation in Energy Use Results


- Survey responses indicate more appliance use in grid connected areas.
- This reveals a measure of latent demand
- We observe appliance energy variation by access type
- In all areas, TV and lighting energy are a significant fraction of the demand.
- In grid locations, a high amount of energy from refrigerators and rice cookers is also observed.
- table: hourly results by access-type or comparison village
- Figure: appliance-hours-detail
- 2016-02-22-appliance-hours-detail.ipynb
- figure: appliance-hours-by-access-type

![Mean daily energy use by appliance type for each type of electricity access](./figures/energy-by-end-use.png)

# Electricity Consumption Measurements

- We observe electricity consumption by village
- Electricity consumption varies by connection type
- We observe 85% or greater uptime for grid connected villages
- We observe 15% to 25% uptime for microgrids
- We estimate daily use by only measuring the days with a full day of electricity usage
- Table:
- rows: measured villages, access type
- columns: average daily energy, unconstrained daily energy

Table: Average daily energy on grid when energy available for the entire day.

|         |   mean kWh per day |   mean kWh per day per household |   median kWh per day |
|:--------|-------------------:|---------------------------------:|---------------------:|
| Ajau    |           611.082  |                         5.05026  |            623.048   |
| Asei    |           186.858  |                         5.66238  |            213.209   |
| Atamali |            15.3702 |                         0.384255 |             16.7874  |
| Ayapo   |            95.3872 |                         0.926089 |             97.4594  |
| Kensio  |            10.7819 |                         0.539094 |              9.85263 |


# Comparison of predicted and observed electricity use

- We focus on the five villages in our survey that also have electricity data
- Table or figure:
- rows: measured villages, access type
- columns: estimated daily energy use, observed average, unconstrained daily
- 2016-03-01-electricity-comparisons.ipynb

- the appliance estimations underestimate the energy use observed on these grids
    - constraints on electricity availability should lead to overestimation
    - ownership estimation errors
    - number of lighting points isn't observed in survey
    - unobserved or recently acquired appliances since survey
    - variance in power levels

![Comparison of inferred and measured electricity usage in villages.](./figures/electricity-comparisons.png)

# Discussion and Conclusion

## Latent demand

- Latent demand has multiple sources
- The delivery of reliable electricity will stimulate appliance purchase
- The delivery of reliable electricity will increase use in some
    appliances
- this forecasting comparison is valuable to practitioners
- refining estimates will improve revenue and cost of capital long term

## Future work

- longitudinal observations will allow us to observe the growth of
    appliance ownership through acquisition and the accompanying growth
    in electricity use
- estimates of electricity increase from latent demand
- signals in electricity use that signal latent demand increases
