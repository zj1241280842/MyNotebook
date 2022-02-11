import pandas as pd
import numpy as np

def angle(indices):
    all_the_data: list = []
    df = pd.read_csv(r'./RAW.txt', sep='\t', header=0)
    df.drop_duplicates(keep=False, inplace=True, ignore_index=False)
    while len(df) > 0:
        df1 = df.head(36)
        df1.index = range(len(df1))
        base = df1.loc[:0, indices].T.to_numpy()
        label = df1.loc[0][0]
        df1 = df1.loc[1:, indices].T.to_numpy()
        a = 10 ** (base.mean(axis=1) / 20)
        b = 10 ** (df1.mean(axis=1) / 20)
        set_of_data = 20 * np.log10(np.divide(a, b))
        set_of_data = list(set_of_data)
        aidi = set_of_data[0] * 0.2 + set_of_data[1] * 0.23 + set_of_data[2] * 0.33 + set_of_data[3] * 0.24
        set_of_data.append(aidi)
        set_of_data.insert(0, label)
        all_the_data.append(set_of_data)
        df = df[36:]
    result = pd.DataFrame(all_the_data, columns=['label', 500, 1000, 2000, 4000, 'aidi'])
    result.to_csv(r'./AIDI.csv', mode='w+', index=False)
    print('写入成功！')


angle(['500', '1000', '2000', '4000'])