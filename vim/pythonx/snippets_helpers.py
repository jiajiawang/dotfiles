import re

def split(inp):
    return re.split('[-_]', re.sub('(?<!\A)([A-Z])', r'_\1', inp))

def to_camel_case(inp):
    return ''.join(map(lambda x: x.lower().capitalize(), split(inp)))

def to_snake_case(inp):
    return '_'.join(map(lambda x: x.lower(), split(inp)))

def to_upper_case(inp):
    return '_'.join(map(lambda x: x.upper(), split(inp)))

def to_kebab_case(inp):
    return '-'.join(map(lambda x: x.lower(), split(inp)))

def autocomplete(inp, options):
    if input == "":
        return options[0]

    for option in options:
        match = re.search("^" + inp, option)
        if match:
            return option[match.end():]

    return ""

def bool(inp):
    return autocomplete(inp, ["true", "false"])
