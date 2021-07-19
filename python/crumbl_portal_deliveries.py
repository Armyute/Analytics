import pandas as pd
import os

path = r'\Users\armst\OneDrive\Boxhead\Otium\Data\Crumbl\\'

deliveries_meridian = pd.read_csv(path+'deliveries_meridian.csv')
deliveries_avondale = pd.read_csv(path+'deliveries_avondale.csv')
deliveries_goodyear = pd.read_csv(path+'deliveries_goodyear.csv')
deliveries_glendale = pd.read_csv(path+'deliveries_glendale.csv')
deliveries_nampa = pd.read_csv(path+'deliveries_nampa.csv')

deliveries_meridian['location'] = '4424689'
deliveries_avondale['location'] = '4577280'
deliveries_goodyear['location'] = '5037310'
deliveries_glendale['location'] = '4831102'
deliveries_nampa['location'] = '4577350'

DATA = deliveries_meridian.append([deliveries_avondale, deliveries_goodyear, deliveries_glendale, deliveries_nampa])
print(DATA)

DATA.to_csv(path+'deliveries.csv', index=False)
