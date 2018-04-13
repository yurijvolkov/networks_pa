import logging
import argparse
import numpy as np

from bokeh.plotting import figure, show
from bokeh.layouts import column

logger = logging.getLogger(__name__)

def fill_ascii():
    ascii_map = dict()

    start_index = int('C0', 16) - 1
    for symb in range(ord('А'), ord('я') + 1):
        ascii_map[chr(symb)] = start_index = start_index + 1

    ascii_map['.'] = int('2C', 16)
    ascii_map[' '] = int('20', 16)

    return ascii_map

def text2bin(text):
    ascii_map = fill_ascii()
    
    bin_code = ''
    for symb in text:
        cur_symb_bin = bin(ascii_map[symb])[2:].zfill(8) 
        bin_code += cur_symb_bin
        logger.info(f'Symbol {symb} -> {cur_symb_bin}')
    return bin_code

def nrz(bin_code):
    x = np.array( list(range(len(bin_code))) )
    y = np.array( list(map(int, bin_code)) )
    
    return (x, y)

def rz(bin_code):
    x = range(len(bin_code)) 
    y = map(int, bin_code) 

    x = np.array( [ [i, i+0.5] for i in x] ).flatten()
    y = np.array( [ [-1, 0] if i == 0 else [1, 0] for i in y]).flatten()

    return (x, y)

def manchester(bin_code):
    x = range(len(bin_code))
    y = map(int, bin_code)

    x = np.array( [ [i, i+0.5] for i in x] ).flatten()
    y = np.array( [ [1, 0] if i == 0 else [0, 1] for i in y]).flatten()

    return (x, y)

def ami(bin_code):
    x, y = nrz(bin_code)

    is_even = False
    for i in range(len(y)):
        if (y[i] == 1) and is_even:
            y[i] = -1
            is_even = False
        elif y[i] == 1:
            is_even = True

    return (x, y)

def nrzi(bin_code):
    x = range(len(bin_code)) 
    y = list(map(int, bin_code))

    for i in range(1, len(y)):
        if y[i] == 1:
            y[i] = abs(y[i-1] - 1)
        else:
            y[i] = y[i-1]

    return (x, y)



def plot_discrete(encodings):
    for ((x, y), title) in encodings:
        delta = x[1] - x[0]

        x = np.array( [ [i, i+delta] for i in x] ).flatten()
        y = np.array( [ [i, i] for i in y] ).flatten()

        p = figure(width=1300, height=300, title=title)
        p.xgrid.minor_grid_line_color = 'navy'
        p.xgrid.minor_grid_line_alpha = 0.1
        p.line(x, y)

        yield p




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Pretty useful (no) program')
    parser.add_argument('--log', type=str, default='ERROR')

    args = parser.parse_args()

    loglevel = getattr(logging, args.log)
    logging.basicConfig(level=loglevel)


    bin_code = text2bin('Волков Ю.В.')
    print(bin_code)

    nrz_plot = nrz(bin_code[:4 * 8])
    rz_plot = rz(bin_code[:4 * 8])
    man_plot = manchester(bin_code[:4 * 8])
    ami_plot = ami(bin_code[:4 * 8])
    nrzi_plot = nrzi(bin_code[:4 * 8])

    plots = list(plot_discrete([(rz_plot, 'RZ'),
                                (nrz_plot, 'NRZ'),
                                (man_plot, 'Manchester'),
                                (ami_plot, 'AMI'),
                                (nrzi_plot, 'NRZI')]))

    show(column(*plots))

