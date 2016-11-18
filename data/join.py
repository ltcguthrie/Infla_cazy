import pandas as pd

import sys



ids_dataframe = open(sys.argv[1], 'r')

tax_dataframe =open(sys.argv[2], 'r')

outfile = open(sys.argv[3],'w')



d1 =  pd.DataFrame.from_csv(ids_dataframe,index_col=False, sep='\t')

d2 =  pd.DataFrame.from_csv(tax_dataframe,index_col=False, sep='\t')



print(list(d1.columns.values))

print(list(d2.columns.values))



a = pd.DataFrame.merge(d1, d2, on='Gene', how='outer')



a.to_csv(outfile,sep='\t')

