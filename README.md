# High-Voltage-Tariff-Optimizer
High Voltage Tariff Optimizer using a combinatorial algorithm.

In this case, the high voltage tariffs of Spain have been studied, where there are 6 possible powers to be contracted. The calculation of the power term is apparently simple.

<img width="116" alt="image" src="https://user-images.githubusercontent.com/107102754/174417603-61d51b25-fa85-4f91-91aa-039eeab8ce3c.png">

Where
FP: Power billing [€]
𝑇𝑃𝑃: Price of the power term of period p [€/kW]
𝑃𝐶𝑃: Power contracted in period p [kW]

However, there are two things to keep in mind.
There are 6 powers to contract, one for each period and they have a restriction: The power contracted in a period must be greater than or equal to the power contracted in the previous period (Pn+1>=Pn). There are also penalties, in the event that the demanded power is greater than the contracted power for each quarter of an hour of each period, a penalty will be applied.

<img width="236" alt="image" src="https://user-images.githubusercontent.com/107102754/174417791-e1ac47f1-2c7e-4987-806a-388ccf17efd5.png">

Where:
𝐹𝐸𝑃: Invoicing of excess power [€]
𝐾𝑃: Price ratio per hourly period p, calculated as the quotient between the power term of period p with respect to the power term of period 1 of the corresponding toll.
Pdj: Power demanded in period j
Pcp: Power contracted in period j

This is where the key to the problem lies, because there must be a compromise between the penalties for excess power and the price of each contracting period and this is what the algorithm solves.

## Input data
A file in Excel or CSV format is needed where the distribution of the data is as follows:

<img width="329" alt="image" src="https://user-images.githubusercontent.com/107102754/174418142-d4de3c7c-1181-452e-8d30-d552250a67e1.png">

Where 'Cuarto' refers to every 15 min within each hour, since the penalties will be applied in these periods of time.

## Result

<img width="419" alt="image" src="https://user-images.githubusercontent.com/107102754/174418394-276aa16a-2b67-456c-a315-11bcb1460b55.png">

The values that each one of the powers to contract in each one of the iterations of the program are observed. You can also see how disturbances have been introduced into the system and how it has responded.

The following image shows the price to be paid by the company

<img width="452" alt="image" src="https://user-images.githubusercontent.com/107102754/174418484-b0a78636-a138-4a95-b473-e4d850c9a51b.png">

The values below correspond to the excess power, the central values correspond to the price of the contracted power and the upper values are a sum of both and represent the total amount to be paid by the company for the term of power. The circles show a mark where the price is minimum, that is, in that case, the group of powers of that iteration would lead to a relative minimum price in the invoice.

Finally, this last graph shows the power demanded for each quarter of an hour of a year by the company studied, together with the optimal powers suggested by the algorithm (Horizontal lines: P1 and P2 -> upper line, P3, P4, P5 and P6 - > bottom line)

<img width="439" alt="image" src="https://user-images.githubusercontent.com/107102754/174418731-14543523-93b0-4828-8390-dafc59cfa512.png">




