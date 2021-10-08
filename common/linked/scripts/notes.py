#!/usr/python

import json
import argparse

def panic(*args):
    print(args)
    exit(1)

def getfile():
    with open("./notes.json", "r") as fil:
        f = fil.read()
    try:
        f = json.loads(f)
    except Expection as err:
        panic(err)
    return f

def savefile(fil):
    with open() as f:
        f.write(json.dumps(fil)

def main():
    notes = getfiles():

    if flag.add:
        pass
    else flag.remove:
        pass
    elif flag.get:
        pass

    savefile(notes)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="save notes, snippet")
    parser.add_argument("-a", "--add", action="store_true", help="add notes", default=False)
    parser.add_argument("-r", "--remove", action="store_true", help="add notes", default=False)
    
    parser.add_argument("-g", "--get", action="store_true", help="add notes", default=False)
    parser.add_argument("-p", "--get-group", action="store_true", help="add notes", default=False)

    parser.add_argument("-g", "--group", action="store_true", help="add notes", default=False)
    parser.add_argument('other', nargs='*')
    flag = parser.parse_args()
    main()
