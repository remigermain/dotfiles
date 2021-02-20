#!/usr/bin/python3
import argparse
import re
import secrets
import os
import json


def get_random_secret_key():
    allowed_char = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)'
    return ''.join(secrets.choice(allowed_char) for i in range(50))

REGEX = r"[\t ]+"
reg_space = re.compile(REGEX)


extra = {
    "__random_key__": get_random_secret_key
}

def error(*args): 
    print(*args)
    exit(-1)


def main():
    # read file
    try:
        with open(flag.file, "r") as f:
            env = json.load(f)
    except Exception as e:
        error(f"file {flag.file} not found")
    
    # change with extra params
    for key, val in env.items():
        if val in extra:
            # cal function
            env[key] = extra[val]()

    # create/merge with original env file
    if flag.merge and os.path.exists(flag.input) and os.path.isfile(flag.input):
        with open(flag.input, "r") as f:
            _file = reg_space.sub(" ", f.read()).split("\n")
            for line in _file:
                _split = line.split("=")
                key = _split[0].strip()
                value = _split[1].strip() if len(_split) == 2 else None
                if key[:6] == "export":
                    key = key[6:].strip()
                if key in env and value:
                    env[key] = value

    # add/replace new flag
    for n in flag.other:
        _split = n.split("=")
        if len(_split) != 2:
            error(f"wrong flag value {_split}")
        env[_split[0]] = _split[1]

    with open(flag.output, "w") as f:
        prefix = "export " if flag.export else ""
        for key, val in env.items():
            f.write(f"{prefix} {key}={val}\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="generate env files")
    parser.add_argument("-f", "--file", help="change path of env's file", default="env.json")
    parser.add_argument("-m", "--merge", action="store_true", help="open existing env file, if key with value exsit, do nothing", default=True)
    parser.add_argument("-o", "--output", help="set the outupt file name", default=".env")
    parser.add_argument("-i", "--input", help="set the input file name", default=".env")
    parser.add_argument("-e", "--export", action="store_true", help="ad export prefix", default=False)
    parser.add_argument('other', nargs='*')
    flag = parser.parse_args()
    main()
