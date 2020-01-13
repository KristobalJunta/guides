# Python snippets

## Human-readable representation of numbers

```python
def human_readable(val):
    """
    Return a human-readable representation of numbers like 1200 -> 1.2k and 1400000 -> 1.4M
    :param val:
    :return:
    """
    for num, prefix in [
        (1000000, "M"),
        (1000, "k"),
    ]:
        if val / num >= 1:
            val = round(val / num, 2)
            if val % 1 == 0:
                val = int(val)
            return "{}{}".format(val, prefix)

    return val
```
