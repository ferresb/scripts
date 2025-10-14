#!/usr/bin/env python3

import bibtexparser
import os
import argparse
from wordcloud import WordCloud
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image

"""
handle special cases here
"""
def special_rules(name):
    if "Khosravian" in name:
        return "Khosravian"
    return name

def parse(args):
    input_name = args.bibtex
    output_name = args.out
    authors=dict()
    with open(input_name) as bibtex_file:
        database = bibtexparser.load(bibtex_file)
        # assume misc entries should not be plotted
        for e in [x for x in database.entries if x.get('ENTRYTYPE') != 'misc']:
            author_string = e.get('author')
            author_list = [(special_rules(x.split(",")[0].strip()), special_rules(x.split(",")[1].strip()[0])) for x in author_string.split("and")]
            if (args.first):
                author_list = [y + ". " + x for (x, y) in author_list]
            else:
                author_list = [x for (x, _) in author_list]
            for a in author_list :
                if a in authors:
                    authors[a] = authors[a] + 1
                else:
                    authors[a] = 1
    if (args.first):
        del authors["B. Ferres"]
    else:
        del authors["Ferres"]
    mask = np.array(Image.open("ellipse.png"))
    wc = WordCloud(background_color="white",
                   width=1000,
                   height=1000,
                   mask=mask,
                   relative_scaling=0.5,
                   normalize_plurals=False).generate_from_frequencies(authors)
    wc.to_file(output_name)

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("bibtex", type=str, help="Input bibtex file to parse")
    parser.add_argument("out", type=str, help="Output png file to save to")
    parser.add_argument("-first", action='store_true', default=False, help="Set true to display initial of first name")
    args = parser.parse_args()
    parse(args)
