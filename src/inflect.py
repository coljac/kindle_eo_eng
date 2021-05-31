import sys
import os
import time
import pandas as pd
import numpy as np
import coltools as ct
import re


def inflect(key):
    root = key[:-1]
    if key.endswith("o"):
        return [root + x for x in ["on", "oj", "ojn"]]
    elif key.endswith("a"):
        return [root + x for x in ["aj", "an", "ajn"]]
    elif key.endswith("e"):
        return [root + "en"]
    elif key.endswith("i"):
        return [root + x for x in ["as", "os", "is", "us", "u", 
            "ita", "ata", "ota", 
            "inta", "anta", "onta", 
            "intan", "antan", "ontan", 
            "intaj", "antaj", "ontaj", 
            "intajn", "antajn", "ontajn"]]
    else:
        return []

def main(argv):
    filen = argv[0]
    lines = open(filen, "r").readlines()
    x = 0
    for line in lines:
        if "idx:orth" in line:
            x+=1
            l = line.strip().replace("</idx:orth>", "")
            key = l.split(">")[1]
            inflections = inflect(key)
            # print(f">>>> {key} , {l}, {line}<<<")
            # print(inflect(key))
            if len(inflections) == 0:
                print(line)
            else:
                print(l)
                print("<idx:infl>")
                for infl in inflections:
                    print('<idx:iform value="' + infl + '" />')
                print("</idx:infl>")
                print("</idx:orth>")

        else:
            print(line)


if __name__ == "__main__":
    main(sys.argv[1:])
